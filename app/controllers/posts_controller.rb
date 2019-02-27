class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to root_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
 
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

end
