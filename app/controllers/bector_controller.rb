class BectorController < ApplicationController
  def index

    if !current_user.nil?

      @users = User.all
      @micropost = current_user.microposts.build
      @informations = current_user.informations
      @direct_messages = current_user.direct_messages

      @users_name_array = []
      @users.each do |user|
        next if user == current_user
        @users_name_array << "@" + user.user_id
      end

      if params[:id]
        reactions = Reaction.where(user_id: params[:id])
        @microposts = []
        reactions.each do |reaction|
          @microposts << Micropost.find_by(id: reaction.reactioned_id)
        end
      elsif params[:user_id]
        if User.find_by(user_id: params[:user_id]).present?
          @microposts = Micropost.where(user_id: User.find_by(user_id: params[:user_id]).id)
        else
          redirect_to "/bector"
        end
      elsif params[:level]
        if params[:level] == "global"
          @microposts = Micropost.all
        elsif params[:level] == "friends"
          @microposts = Micropost.where(user_id: current_user.id)
          follow_users = current_user.following
          follow_users.each do |user|
            if user.following.include?(current_user)
              @microposts += Micropost.where(user_id: user.id)
            end
          end
          @microposts = @microposts.sort.reverse

        end
      elsif params[:tag]
        @microposts = []
        target_tags = Tag.where(name: params[:tag])
        target_tags.each do |tag|
          @microposts << Micropost.find_by(id: tag.micropost_id)
        end
      else

        @microposts = Micropost.where(user_id: current_user.id)
        follow_users = current_user.following
        follow_users.each do |user|
          @microposts += Micropost.where(user_id: user.id)
        end
        @microposts = @microposts.sort.reverse
      end

    else
      @microposts = Micropost.all
      @users = User.all
    end
  end

  def create
    if params[:direct_message]
      @direct_message = current_user.direct_messages.build(direct_message_params)

      if @direct_message.save
        redirect_to bector_index_url
      else
        render :index
      end

    elsif params[:micropost]
      @micropost = current_user.microposts.build(micropost_params)
      image_flg = false
      if params[:image]
        image_flg = true
        image = params[:image]
        File.binwrite("public/micropost_images/undecide.png", image.read)
      end



      if @micropost.save
        flash[:success] = "Micropost created!"
        tag_array = params[:micropost][:tags].split(/[[:blank:]]+/);
        tag_array.each do |tag|
          @tag = @micropost.tags.build
          @tag.name = tag
          @tag.save
        end
        if image_flg
          @micropost.image_name = "#{@micropost.id}.png"
          File.rename("public/micropost_images/undecide.png", "public/micropost_images/#{@micropost.image_name}")
          @micropost.save
        end
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

  private
  def micropost_params
   params.require(:micropost).permit(
     :content
    )
  end

  def direct_message_params
    params.require(:direct_message).permit(
      :message,
      :target_user
    )
  end
end
