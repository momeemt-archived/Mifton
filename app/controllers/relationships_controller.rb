class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)

    @information = Information.new(
      user_id: current_user.id,
      from_any_service: "follow",
      starting_point_user: user.id,
      content: "あなたをフォローしました。"
    )
    @information.save

    if params[:service] == "Bector"
      redirect_to "/bector/users/#{user.user_id}"
    else
      redirect_to "/#{user.user_id}"
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    if params[:service] == "Bector"
      redirect_to "/bector/users/#{user.user_id}"
    else
      redirect_to "/#{user.user_id}"
    end
  end
end
