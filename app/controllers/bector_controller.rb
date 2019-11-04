class BectorController < ApplicationController
  before_action :add_users_and_infos, only: [:global, :friends, :tags, :index, :show]

  def index
    if login?
      @microposts = Micropost.where(user_id: current_user.id)
      follow_users = current_user.following
      follow_users.each do |user|
        @microposts += Micropost.where(user_id: user.id)
      end
      @microposts = @microposts.sort.reverse
      @microposts = Kaminari.paginate_array(@microposts).page(params[:page]).per(20)
      @random_users = @users.where.not(id: current_user.id).sample(5)
      @random_tags = Tag.all.sample(5)
      render "bector/logged-in/index"

    else
      @microposts = Micropost.all
      @users = User.all
      @user = User.new

      render "bector/logging-out/index"
    end
  end

  def notifications
    if login?
      @notifications = current_user.notifications.where(from_service: "bector").page(params[:page]).per(20)
      @user = current_user
      @users = User.all
      @random_users = @users.where.not(id: current_user.id).sample(5)
      @random_tags = Tag.all.sample(5)
      render "bector/logged-in/notifications"
    end
  end

  def user
    if login?
      @user = User.find_by(user_id: params[:user_id])
      if @user.present?
        @posts = Micropost.where(user_id: @user.id)
        render :user_index
      else
        redirect_to "/bector"
      end
    end
  end




  def comment
    @comment = current_user.comments.build(comment_params)
    @comment.save

    post = Micropost.find(@comment.parent_id)
    unless post.user_id == current_user.id
      @notification = User.find(post.user_id).notifications.build(
        kind: "comment",
        is_public: false,
        target: @comment.id,
        from_user: current_user.id,
        from_service: "bector"
      )
      @notification.save
    end
    redirect_back(fallback_location: root_path)
  end

  def reactions
    @microposts = []
    @user = User.find(params[:id])
    reactions_obj = Reaction.where(user_id: params[:id])
    reactions_obj.each do |reaction|
      target_object = Micropost.find_by(id: reaction.reactioned_id)
      if !@microposts.include?(target_object) && target_object.user_id.present?
        @microposts << target_object
      end
    end

    render "bector/logged-in/index"
  end

  def global
    @users = User.all
    @microposts = Micropost.all
    @microposts = Kaminari.paginate_array(@microposts).page(params[:page]).per(20)
    @random_users = @users.where.not(id: current_user.id).sample(5)
    @random_tags = Tag.all.sample(5)
    render "bector/logged-in/index"
  end

  def friends
    @microposts = Micropost.where(user_id: current_user.id)
    follow_users = current_user.following
    follow_users.each do |user|
      if user.following.include?(current_user)
        @microposts += Micropost.where(user_id: user.id)
      end
    end
    @microposts = @microposts.sort.reverse
    @microposts = Kaminari.paginate_array(@microposts).page(params[:page]).per(20)
    @random_users = @users.where.not(id: current_user.id).sample(5)
    @random_tags = Tag.all.sample(5)
    render "bector/logged-in/index"
  end

  def media
    @users = User.all
    @microposts = Micropost.where.not(images: nil)
    @microposts = Kaminari.paginate_array(@microposts).page(params[:page]).per(20)
    @informations = current_user.informations
    render "bector/logged-in/index"
  end

  def tags
    @microposts = []
    target_tags = Tag.where(name: params[:tag])
    target_tags.each do |tag|
      @microposts << Micropost.find_by(id: tag.micropost_id)
    end
    @microposts = Kaminari.paginate_array(@microposts).page(params[:page]).per(20)
    @random_users = @users.where.not(id: current_user.id).sample(5)
    @random_tags = Tag.all.sample(5)
    render "bector/logged-in/index"
  end

  def create
    if params[:micropost]
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        tag_array = params[:micropost][:tags].split(/[[:blank:]]+/);
        tag_array.each do |tag|
          @tag = @micropost.tags.build
          @tag.name = tag
          @tag.save
        end
        redirect_back(fallback_location: root_path)
      else
        render "bector/logged-in/index"
      end

    elsif params[:topic]
      @topic = current_user.topics.build(topic_params)
      if @topic.save
        redirect_back(fallback_location: root_path)
      else
        render "bector/logged-in/index"
      end
    end
  end


  def search
    user_id = params[:user_id]
    redirect_to "/bector/users/#{user_id}"
  end

  def destroy
    @post = current_user.microposts.find_by(id: params[:micropost][:post_id])
    @post.destroy
    redirect_to bector_index_url
  end

  def show
    @micropost  = Micropost.find_by(id: params[:id])
    @comments = Comment.where(parent_model: "bector", parent_id: params[:id])
  end

  private
  def micropost_params
   params.require(:micropost).permit(
     :content,
     images: []
    )
  end

  def topic_params
    params.require(:topic).permit(
      :title,
      :content,
      images: []
    )
  end

  def direct_message_params
    params.require(:direct_message).permit(
      :message,
      :target_user
    )
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :image_name,
      :parent_model,
      :parent_id
    )
  end

  def add_users_and_infos
    if !current_user.nil?
      @users = User.all
      @informations = current_user.informations

      user_raw_data = User.find_by(user_id: params[:user_id])
      if user_raw_data.present?
        @user = user_raw_data
      else
        @user = current_user
      end
    end
  end

end
