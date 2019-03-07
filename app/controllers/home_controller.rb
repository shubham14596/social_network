class HomeController < ApplicationController

  def index
    @comment = Comment.new 
    if user_signed_in?
      @posts = current_user.posts
    else
      redirect_to '/users/sign_in'
    end
  end

end
