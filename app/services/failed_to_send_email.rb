class FailedToSendEmail < StandardError
  def initialize(message = "Failed to send email")
    super
  end
end