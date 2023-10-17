class EventsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.create(event_params.merge(user: current_user))
    render json: event, status: 201
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
