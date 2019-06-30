class BectorController < ApplicationController

  def index
    @microposts = Micropost.all
    @users = User.all
    @micropost = current_user.microposts.build
    @informations = current_user.informations
    @direct_messages = current_user.direct_messages

    @users_name_array = []
    @users.each do |user|
      next if user == current_user
      @users_name_array << "@" + user.user_id
    end
  end

  def create
    puts params

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
        if image_flg
          @micropost.image_name = "#{@micropost.id}.png"
          File.rename("public/micropost_images/undecide.png", "public/micropost_images/#{@micropost.image_name}")
          @micropost.save
        end
        redirect_to "/bector"
      else
        render :index
      end
    end
  end

  private

  def micropost_params
   params.require(:micropost).permit(:content)
  end

  def direct_message_params
    params.require(:direct_message).permit(
      :message,
      :target_user
    )
  end
end
