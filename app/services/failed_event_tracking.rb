class FailedEventTracking < StandardError
  def initialize(message = "Failed to event tracking")
    super
  end
end