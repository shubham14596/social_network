class HomeController < ApplicationController

  def index
    if !(user_signed_in?)
      redirect_to welcome_sign_in_path
    end
  end

  def search
    if params[:friend]
      @users = User.where('first_name LIKE ?', "%#{params[:friend]}%")
    else
      @users = User.all
    end
  end

  def friends
    @friends = current_user.friends
    @friends = @friends + (current_user.inverse_friends)
  end

  def show
    @user = User.find_by_id(params[:user_id])
  end

end
