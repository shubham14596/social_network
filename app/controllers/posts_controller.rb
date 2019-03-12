class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    # respond_with Post.create(post_params.merge(user_id: current_user.id))
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
