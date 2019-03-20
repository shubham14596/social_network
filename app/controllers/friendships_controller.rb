class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id], status: 0)
    flash[:notice] = 'Unable to send request' unless @friendship.save
    redirect_to root_url
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    flash[:notice] = 'Unable to delete frendship' unless @friendship.destroy
    redirect_to root_url
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    flash[:notice] = 'Unable to add friend' unless @friendship.update_attribute(:status, 1)
    redirect_to root_url
  end
end
