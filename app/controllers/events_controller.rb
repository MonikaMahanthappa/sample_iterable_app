class EventsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.create(event_params.merge(user: current_user))
    iterable_api = IterableApi.new(ENV["iterable_api_key"], "#{ENV['iterable_api_base_url']}/api")
    iterable_api.track_web_push_click(current_user, event)
    render json: event, status: 201
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
