class HomeController < ApplicationController

  def index
    if user_signed_in?
      @posts = current_user.posts
    else
      redirect_to welcome_sign_in_path
    end
  end

end
