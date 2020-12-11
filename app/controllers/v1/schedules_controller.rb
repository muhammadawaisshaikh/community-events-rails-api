class V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all
    render json: { schedules: schedules }, status: :ok
  end

  def create
    schedule = Schedule.new(schedule_params)

    if schedule.save
      render json:schedule, status: :created
    else
      render json: {errors: schedule.errors}, status: :unprocessable_entity
    end
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: schedule, status: :ok
  end  

  def update
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      render json: schedule, status: :ok
    else
      render json: { errors: schedule.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    head 204
  end

  private
  
  def schedule_params
    params.require(:schedule).permit(:start_date, :start_time, :end_date, :end_time)
  end
end
