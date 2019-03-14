class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.status = 0
    flash[:notice] = 'Unable to send request' unless @friendship.save
    redirect_to root_url
  end

  def destroy
    @friendship = current_user.friendships.find_by_id(params[:id])
    @friendship.destroy
    redirect_to root_url
  end

  def update
    by_user = User.find_by_id(params[:friend_id])
    @friendship = by_user.friendships.find_by_id(params[:id])
    flash[:notice] = 'Unable to add friend' unless @friendship.update_attribute(:status, 1)
    redirect_to root_url
  end
end
