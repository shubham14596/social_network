class LikesController < ApplicationController
  before_action :authenticate_user!, :set_up_likable

  def create
    @like = @likable.likes.build(user_id: current_user.id)
    respond_to do |format|
      @like.save ? format.js : format.js { render :create_alert }
    end
  end

  def destroy
    @like = @likable.likes.find(params[:id])
    respond_to do |format|
      @like.destroy ? format.js : format.js { render :destroy_alert }
    end
  end

  private

  def set_up_likable
    unless (@likable =
      if params[:post_id]
        Post.find(params[:post_id])
      else
        Comment.find(params[:comment_id])
      end)
      flash[:notice] = 'Not found'
      render layout: false
    end
  end
end
