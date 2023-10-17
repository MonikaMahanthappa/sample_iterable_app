require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "POST /events" do
    it 'should create event' do
      post "/events", params: {
        event: {
          name: 'A'
        }
      }
      expect(response.status).to eq(201)
      expect(Event.find_by(name: 'A')).to_not be_nil
    end
  end
end
