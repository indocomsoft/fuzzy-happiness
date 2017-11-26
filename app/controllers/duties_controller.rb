class DutiesController < ApplicationController

  def index
    @duties = Duty.all
    if params.has_key? "date"
      temp = Date.parse(params[:date])
      @basedate = temp.beginning_of_week
    else
      @basedate = Date.today.beginning_of_week
    end
  end

  def new
    @supervisors = Supervisor.all
    @date = Date.parse(params[:date])
    @duty = Duty.new
  end

  def create
    duty = Duty.new duty_params
    duty.dropped = false
    date = Date.parse(params[:date])
    duty.date = date
    if duty.save
      redirect_to duties_path(date: date.beginning_of_week)
    else
      redirect_to new_duty_path(date: date)
    end
  end

  def edit
    @duty = Duty.find params[:id]
    @date = @duty.date
    if @duty.dropped
      @supervisors = Supervisor.all
    else
      @duty.dropped = true
      if @duty.save then
        redirect_to duties_path(date: @date.beginning_of_week)
      end
    end
  end

  def update
    duty = Duty.find params[:id]
    if duty.update duty_params then
      duty.dropped = false
      if duty.save
        redirect_to duties_path(date: duty.date.beginning_of_week)
      end
    end
  end

  def dropped
    @dropped = Duty.where({dropped: true})
  end

  private
  def duty_params
    params.require(:duty).permit(:date, :supervisor_id)
  end
end
