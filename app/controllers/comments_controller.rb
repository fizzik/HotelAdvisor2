class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = current_user.id
    @comment.hotel_id = params[:hotel_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back}
        format.js
      else
        format.html { redirect_to :back, :notice => "Error, try again!" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end