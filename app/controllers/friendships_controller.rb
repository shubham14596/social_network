class FriendshipsController < ApplicationController
  before_action :authenticate_user!, :find_friendship, only: [:destroy, :update]

  def create
    @friendship = current_user.friendships.create(friend_id: params[:friend_id], status: 0)
    if @friendship.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if (@friendship.user_id == current_user.id) || (@friendship.friend_id == current_user.id)
      if @friendship.destroy
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    if @friendship.friend_id == current_user.id
      if @friendship.update_attribute(:status, 1)
        redirect_back(fallback_location: root_path)
      end
    end
  end

  private

  def find_friendship
    unless @friendship = Friendship.find_by(id: params[:id])
      render layout: false
    end
  end
end
