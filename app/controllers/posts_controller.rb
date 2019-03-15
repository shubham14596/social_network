class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    # respond_with Post.create(post_params.merge(user_id: current_user.id))
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    respond_to do |format|
      if @post.save
        format.js
        format.html { redirect_to root_path }
      else
        flash[:notice] = 'Unable to create post'
      end
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    flash[:notice] = 'Unable to delete post' unless @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
