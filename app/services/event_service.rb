class EventService
  def initialize(iterable_api)
    @iterable_api = iterable_api
  end
  def create(user, event_params)
    event = Event.create(event_params.merge(user: user))
    @iterable_api.track_web_push_click(user, event)
    @iterable_api.send_email(user)
    event
  end
end