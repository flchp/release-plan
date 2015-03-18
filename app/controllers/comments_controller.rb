class CommentsController < ApplicationController

  before_action :login_required


  def edit
    @comment = current_user.comments.find(params[:id])
  end


  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update(comment_params)
      case @comment.commentable.class.to_s
      when "Problem"
        redirect_to problem_path(@comment.commentable)
      else
        redirect_to problem_path(@comment.commentable.problem)
      end
    else
      render :edit
    end
  end


  protected


  def comment_params
    params.require(:comment).permit(:content)
  end
end
