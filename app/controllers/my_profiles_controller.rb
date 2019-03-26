class MyProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def requests
    @requests = current_user.inverse_friends.where('friendships.status = ?', 0)
  end

  def timeline
    redirect_to welcome_sign_in_path unless user_signed_in?
  end

  def about
  end

  def friends
    friends = current_user.friends.where('friendships.status = ?', 1)
    @friends = friends + current_user.inverse_friends.where('friendships.status = ?', 1)
  end

  def photos
  end
end
