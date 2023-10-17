require 'rails_helper'

RSpec.describe "Events", type: :request do
  let!(:signed_in_user) { create(:user) }

  describe "POST /events" do
    before do
      sign_in signed_in_user
    end

    it 'should create event' do
      post events_path, params: {
        event: {
          name: 'A'
        }
      }
      expect(response.status).to eq(201)
      expect(Event.find_by(name: 'A')).to_not be_nil
    end
  end
end
