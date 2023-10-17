class EventsController < ApplicationController
  def create
    event = Event.create(event_params)
    render json: event, status: 201
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
