class ProblemsController < ApplicationController
  before_action :login_required, :except => [:index]
  def index
    @problems = Problem.all

    @problems_grid = initialize_grid(@problems)
  end


  def new
    @problem = Problem.new
  end


  def create
    @problem = current_user.problems.build(problem_params)

    if @problem.save
      redirect_to problems_path
    else
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
    @comment = Comment.new
    @solution_comment = Comment.new
  end


  protected


  def problem_params
    params.require(:problem).permit(:title,:description, :causes)
  end
end
