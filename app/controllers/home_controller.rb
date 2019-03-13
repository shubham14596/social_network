class HomeController < ApplicationController

  def index
    if user_signed_in?
      @posts = current_user.posts
    else
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

  def show
    @user = User.find_by_id(params[:user_id])
  end

end
