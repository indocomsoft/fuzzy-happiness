class ProblemsController < ApplicationController

  def index
    @problems = Problem.all
    @supervisors = Supervisor.all
  end

  def new
    @problem = Problem.new
    @supervisors = Supervisor.all
  end

  def create
    problem = Problem.new problem_params
    problem.fixed = false
    problem.time = Time.now.getutc
    if problem.save
      redirect_to problems_path
    else
      redirect_to new_problem_path
    end
  end

  def edit
    @problem = Problem.find params[:id]
    @supervisors = Supervisor.all
  end

  def update
    problem = Problem.find params[:id]
    if problem.update problem_params
      redirect_to problems_path
    else
      redirect_to edit_problem_path(problem)
    end
  end

  def destroy
    problem = Problem.find params[:id]
    if problem.destroy
      redirect_to problems_path
    end
  end

  private
  def problem_params
    params.require(:problem).permit(:supervisor_id, :computer, :details, :fixed)
    #params[:computer] = params[:computer].to_i
  end
end