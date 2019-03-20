class FriendshipsController < ApplicationController
  before_action :authenticate_user!, :find_friendship, only: [:destroy, :update]

  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id], status: 0)
    flash[:notice] = 'Unable to send request' unless @friendship.save
    redirect_to root_url
  end

  def destroy
    flash[:notice] = 'Unable to delete frendship' unless @friendship.destroy
    redirect_to root_url
  end

  def update
    flash[:notice] = 'Unable to add friend' unless @friendship.update_attribute(:status, 1)
    redirect_to root_url
  end

  private

  def find_friendship
    @friendship = Friendship.find_by(id: params[:id])
  end
end
