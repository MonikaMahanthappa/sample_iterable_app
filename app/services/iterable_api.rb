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

  def send_email(user)
    request_body = {
      "recipientEmail": user.email,
      "recipientUserId": user.id.to_s,
      "sendAt": DateTime.parse(Time.now.to_s).strftime("%Y-%m-%d %H:%M:%S"),
      "dataFields": {},
    }.to_json
    begin
      RestClient.post("#{@base_url}/email/target", request_body, headers: {
        'Api-Key' => @api_key,
        'Content-Type' => 'application/json'
      })
    rescue RestClient::ExceptionWithResponse => err
      raise FailedToSendEmail
    end
  end
end