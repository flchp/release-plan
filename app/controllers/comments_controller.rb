class CommentsController < ApplicationController

  before_action :login_required
  before_action :find_resource


  def edit
    @comment = current_user.comments.find(params[:id])
  end


  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update(comment_params)
      redirec_to problem_path(@resource)
    else
      render :edit
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])

  end

  protected



  def find_resource
    @resource = case @comment.commentable.class.to_s
    when "Problem"
      @comment.commentable
    else
      @comment.commentable.proble
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
