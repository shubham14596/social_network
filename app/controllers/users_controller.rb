class UsersController < ApplicationController
  before_action :find_user, only: [:about, :friends, :photos, :show]

  def search
    @users =
      if params[:friend]
        User.search_by_first_name(params[:friend])
      else
        User.all
      end
  end

  def about
  end

  def friends
    friends = @user.friends.where('friendships.status = ?', 1)
    @friends = friends + @user.inverse_friends.where('friendships.status = ?', 1)
  end

  def photos
  end

  def show
  end

  private

  def find_user
    unless @user = User.find_by_id(params[:user_id])
      flash[:notice] = 'User not found'
      render layout: false
    end
  end
end
