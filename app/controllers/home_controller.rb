class HomeController < ApplicationController
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

  def friends
    friends = current_user.friends
    @friends = friends + current_user.inverse_friends
  end

  def show
    @user = User.find_by_id(params[:user_id])
  end
end
