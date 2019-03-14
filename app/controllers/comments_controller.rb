class CommentsController < ApplicationController
  before_action :authenticate_user!, :find_post

  def create
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    @comment.save
    respond_to do |format|
      format.js
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
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end
end
