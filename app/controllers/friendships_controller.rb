class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    flash[:notice] = 'Unable to add friend' unless @friendship.save
    redirect_to root_url
  end

  def destroy
    @friendship = current_user.friendships.find_by_id(params[:id])
    @friendship.destroy
    redirect_to root_url
  end
end
