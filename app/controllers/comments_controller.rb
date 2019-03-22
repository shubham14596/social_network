class CommentsController < ApplicationController
  before_action :authenticate_user!, :find_post

  def create
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
      @comment.save ? format.js : format.js { render :create_alert }
    end
  end

  def index
    @comments = @post.comments
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comments = @post.comments
    @comment = @comments.find(params[:id])
    respond_to do |format|
      @comment.destroy ? format.js : format.js { render :destroy_alert }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    unless @post = Post.find_by_id(params[:post_id])
      flash[:notice] = 'Post not found'
      render layout: false
    end
  end
end
