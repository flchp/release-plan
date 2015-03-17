class ProblemCommentsController < ApplicationController

  before_action :find_problem
  before_action :login_required
  
  def create
   
    @comment = @problem.comments.build(comment_params)
    
    @comment.user = current_user

    if @comment.save
      redirect_to problem_path(@problem, :anchor => "comment_#{@comment.id}")
    else
      render "problems/show"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_problem
    @problem = Problem.find(params[:problem_id])
  end


end
