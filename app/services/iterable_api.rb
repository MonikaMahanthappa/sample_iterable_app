class IterableApi
  def initialize(api_key, base_url)
    @api_key = api_key
    @base_url = base_url
  end

  def track_web_push_click(user, event)
    begin
      RestClient.post("#{@base_url}/events/trackWebPushClick", {
        "email": user.email,
        "messageId": event.id.to_s
      }, headers: {
        'Api-Key' => @api_key,
        'Content-Type' => 'application/json'
      })
    rescue RestClient::ExceptionWithResponse
      raise FailedEventTracking
    end
  end
end