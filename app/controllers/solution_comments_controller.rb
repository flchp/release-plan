class SolutionCommentsController < ApplicationController

  before_action :login_required, :except => [:index]
  before_action :find_solution

  def create
   
    @solution_comment = @solution.comments.build(comment_params)
    
    @solution_comment.user = current_user

    if @solution_comment.save
      redirect_to problem_path(@problem,:anchor => "comment_#{@solution_comment.id}")
    else
      render "problems/show"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_solution
    @solution = Solution.find(params[:solution_id])
    @problem = @solution.problem
  end


end
