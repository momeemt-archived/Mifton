class ReactionsController < ApplicationController

  def create
    #render params
    @reaction = Reaction.new(
      user_id: current_user.id,
      reactioned_id: params[:reactioned_id],
      reactioned_type: params[:reactioned_type]
    )

    @reaction.save
    post = Micropost.find_by(
      id: params[:reactioned_id]
    )

    unless post.user_id == current_user.id
      @information = Information.new(
        user_id: post.user_id,
        from_any_service: "bector",
        target_object: post.content,
        starting_point_user: current_user.id,
        content: "#{User.find_by(id: current_user.id).name}が#{generate_content(params[:reactioned_type])}"
      )
      @information.save
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @reaction = Reaction.find_by(
      user_id: current_user.id,
      reactioned_id: params[:reactioned_id],
      reactioned_type: params[:reactioned_type]
    )
    @reaction.destroy

    post = Micropost.find_by(
      id: params[:reactioned_id]
    )

    unless post.user_id == current_user.id
      @information = Information.find_by(
        user_id: post.user_id,
        from_any_service: "bector",
        target_object: post.content,
        starting_point_user: current_user.id,
        content: "#{User.find_by(id: current_user.id).name}が#{generate_content(params[:reactioned_type])}"
      )
      @information.destroy
    end

    redirect_back(fallback_location: root_path)
  end

  private

    def generate_content (type)
      content = ""

      if type == "heart"
        content = "あなたの投稿をとても気に入っています！"
      elsif type == "good"
        content = "あなたの投稿をいいねしました！"
      elsif type == "cry"
        content = "あなたの投稿に涙しました><"
      elsif type == "surprise"
        content = "あなたの投稿に驚いています！"
      elsif type == "angry"
        content = "あなたの投稿に怒りを感じています"
      end

      content
    end

end
