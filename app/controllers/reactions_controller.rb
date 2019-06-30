class ReactionsController < ApplicationController

  def create
    @reaction = Reaction.new(
      user_id: current_user.id,
      reactioned_id: params[:reactioned_id],
      reactioned_type: "bector"
    )
    @reaction.save
    post = Micropost.find_by(
      id: params[:reactioned_id]
    )
    @information = Information.new(
      user_id: post.user_id,
      content:"#{User.find_by(id: current_user.id).name}があなたの投稿をいいねしました！\n<<#{post.content}>>",
      info_type: "bector"
    )
    @information.save
    redirect_to bector_index_url
  end

  def destroy
    @reaction = Reaction.find_by(
      user_id: current_user.id,
      reactioned_id: params[:reactioned_id],
      reactioned_type: "bector"
    )
    @reaction.destroy
    redirect_to bector_index_url
  end

end
