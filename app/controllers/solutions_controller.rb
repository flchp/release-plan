class SolutionsController < ApplicationController

  before_action :login_required, :except => [:index]
  before_action :find_problem
  

  def new
    @solution = @problem.solutions.build
  end

  def create
   
    @solution = @problem.solutions.build(solution_params)
    
    @solution.user = current_user

    if @solution.save
      redirect_to problem_path(@problem)
    else
      render :new
    end
  end

  def edit
    @solution = current_user.solutions.find(params[:id])
  end
  

  def update
    @solution = current_user.solutions.find(params[:id])

    if @solution.update(solution_params)
      redirect_to problem_path(@problem)
    else
      render :edit
    end
  end

  protected

  def solution_params
    params.require(:solution).permit(:content, :title)
  end

  def find_problem
    @problem = Problem.find(params[:problem_id])
  end

end
