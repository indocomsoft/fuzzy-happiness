class SupervisorsController < ApplicationController
  def index
    @supervisors = Supervisor.all
  end

  def new
    @supervisor = Supervisor.new
  end

  def create
    supervisor = Supervisor.new supervisor_params
    if supervisor.save
      redirect_to supervisors_path
    else
      redirect_to new_supervisor_path
    end
  end

  def edit
    @supervisor = Supervisor.find params[:id]
  end

  def update
    supervisor = Supervisor.find params[:id]
    if supervisor.update supervisor_params
      redirect_to supervisors_path
    else
      redirect_to edit_supervisor_path(supervisor)
    end
  end

  def destroy
    supervisor = Supervisor.find params[:id]
    if supervisor.destroy
      redirect_to supervisors_path
    end
  end

  private
  def supervisor_params
    params.require(:supervisor).permit(:fullname, :phone_number, :email)
  end
end