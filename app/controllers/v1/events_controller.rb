class V1::EventsController < ApplicationController
  def index
    events = Event.all
    render json: { events: events }, status: :ok
  end

  def create
    event = Event.new(event_params)

    if event.save
      render json:event, status: :created
    else
      render json: {errors: event.errors}, status: :unprocessable_entity
    end
  end

  def show
    event = Event.find(params[:id])
    render json: event, status: :ok
  end  

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: event, status: :ok
    else
      render json: { errors: event.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    head 204
  end

  private
  
  def event_params
    params.require(:event).permit(:title, :description, :event_url, :hashtags, :location, :images, :schedule_id, :user_id)
  end
end
