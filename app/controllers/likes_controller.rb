class LikesController < ApplicationController
  before_action :set_up_likable
  
  def create
    @like = @likable.likes.new
    @like.user_id = current_user.id
    @like.save
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    @like = @likable.likes.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def set_up_likable
    if params[:post_id]
      @likable = Post.find(params[:post_id])
    else
      @likable = Comment.find(params[:comment_id])
    end
  end

end
