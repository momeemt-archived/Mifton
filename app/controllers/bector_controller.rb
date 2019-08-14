class BectorController < ApplicationController
  before_action :add_users_and_infos, only: [:global, :friends, :tags, :index, :reactions, :show]
  def index

    if !current_user.nil?

      if params[:user_id]
        target_user = User.find_by(user_id: params[:user_id])
        if target_user.present?
          @microposts = Micropost.where(user_id: target_user.id)
        else
          redirect_to "/bector"
        end

      else

        ## OPEN
        @microposts = Micropost.where(user_id: current_user.id)
        follow_users = current_user.following
        follow_users.each do |user|
          @microposts += Micropost.where(user_id: user.id)
        end
        @microposts = @microposts.sort.reverse
        ##
      end

      render :index

    else
      @microposts = Micropost.all
      @users = User.all

      render :top
    end
  end

  def comment
    @comment = current_user.comments.build(comment_params)
    @comment.save

    unless Micropost.find(@comment.parent_id).user_id == current_user.id
      @information = Information.new(
        user_id: current_user.id,
        from_any_service: "comment",
        starting_point_user: Micropost.find(@comment.parent_id).user_id,
        content: "あなたの投稿にコメントをしました。",
        target_object: @comment.id
      )
      @information.save
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

    render :index
  end

  def global
    @users = User.all
    @microposts = Micropost.all
    @informations = current_user.informations
    render :index
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
    render :index
  end

  def media
    @users = User.all
    @microposts = Micropost.all
    @informations = current_user.informations
    render :index
  end

  def tags
    @microposts = []
    target_tags = Tag.where(name: params[:tag])
    target_tags.each do |tag|
      @microposts << Micropost.find_by(id: tag.micropost_id)
    end

    render :index
  end

  def create
    # if params[:direct_message]
    #   @direct_message = current_user.direct_messages.build(direct_message_params)
    #
    #   if @direct_message.save
    #     redirect_to bector_index_url
    #   else
    #     render :index
    #   end
    #
    # els
    if params[:micropost]
      @micropost = current_user.microposts.build(micropost_params)
      # image_flg = false
      # if params[:micropost][:image]
      #   image_flg = true
      #   image = params[:micropost][:image]
      #   File.binwrite("public/micropost_images/undecide.png", image.read)
      # end



      if @micropost.save
        flash[:success] = "Micropost created!"
        tag_array = params[:micropost][:tags].split(/[[:blank:]]+/);
        tag_array.each do |tag|
          @tag = @micropost.tags.build
          @tag.name = tag
          @tag.save
        end
        # if image_flg
        #   @micropost.image_name = "#{@micropost.id}.png"
        #   File.rename("public/micropost_images/undecide.png", "public/micropost_images/#{@micropost.image_name}")
        #   @micropost.save
        # end
        redirect_back(fallback_location: root_path)
      else
        render :index
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
