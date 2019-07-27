class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
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
