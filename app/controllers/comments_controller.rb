class CommentsController < ApplicationController
  
  before_filter :load_commentable
  
  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.member = @member
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  protected
  def load_commentable
    @commentable = params[:comment][:commentable_type].camelize.constantize.find(params[:comment][:commentable_id])
  end
  
end