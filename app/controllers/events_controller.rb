class EventsController < ApplicationController
  before_action :authenticate_user!

  def create
    iterable_api = IterableApi.new(ENV["iterable_api_key"], "#{ENV['iterable_api_base_url']}/api")
    event = EventService.new(iterable_api).create(current_user, event_params)
    render json: event, status: 201
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
