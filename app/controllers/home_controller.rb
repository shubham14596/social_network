class HomeController < ApplicationController
  before_action :find_user

  def index
    redirect_to welcome_sign_in_path unless user_signed_in?
  end

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
      @friends = []
      friendships.each { |f| @friends.push(User.find_user(f.friend_id)) }
      inverse_friendships.each { |f| @friends.push(User.find_user(f.user_id)) }
      @friends.uniq!
  end

  def photos
  end

  def show
  end

  private

  def find_user
    @user = User.find_by_id(params[:user_id])
  end

  private

  def friendships
    @friendships = @user.friendships.where(status: 1)
  end

  def inverse_friendships
    @inverse_friendships = @user.inverse_friendships.where(status: 1)
  end
end
