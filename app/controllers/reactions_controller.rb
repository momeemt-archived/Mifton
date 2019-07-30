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
        user_id: current_user.id,
        from_any_service: "bector",
        target_object: post.id,
        starting_point_user: post.user_id,
        content: "あなたの投稿にリアクションしました。"
      )
      @information.save
    end

    @post_id = params[:post_id]
    @user = params[:user]

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end

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
        user_id: current_user.id,
        from_any_service: "bector",
        target_object: post.id,
        starting_point_user: post.user_id,
        content: "あなたの投稿にリアクションしました。"
      )
      if @information.present?
        @information.destroy
      end
    end

    @post_id = params[:post_id]
    @user = params[:user_data]

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end

    #redirect_back(fallback_location: root_path)
  end

  private

end
