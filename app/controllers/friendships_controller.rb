class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by_id(params[:id])
    @friendship.destroy
    redirect_to root_url
  end

end
