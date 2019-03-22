class FriendshipsController < ApplicationController
  before_action :authenticate_user!, :find_friendship, only: [:destroy, :update]

  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id], status: 0)
    @friendship.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @friendship.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    flash[:notice] = 'Unable to add friend' unless @friendship.update_attribute(:status, 1)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_friendship
    @friendship = Friendship.find_by(id: params[:id])
  end
end
