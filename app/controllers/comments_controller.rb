class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    @comment.save
    respond_to do |format|
      format.js
    end

  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
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

end
