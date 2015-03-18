class ProblemsController < ApplicationController
  before_action :login_required

  def index
    @problems = Problem.all
  end


  def new
    @problem = Problem.new
  end

  def edit
    @problem = current_user.problems.find(params[:id])
  end

  def update
    @problem = current_user.problems.find(params[:id])

    if @problem.update(problem_params)
      redirect_to problem_path(@problem)
    else
      render :edit
    end
  end

  def create
    @problem = current_user.problems.build(problem_params)

    if @problem.save
      redirect_to problem_path(@problem)
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
