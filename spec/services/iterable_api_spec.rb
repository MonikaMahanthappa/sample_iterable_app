require 'rails_helper'
require 'webmock/rspec'

describe 'IterableApi' do
  let(:api_key) { 'dummy_api_key' }

  context 'when event track api is triggered' do
    let(:base_url) { 'https://sample-test/api' }
    let(:web_push_url) { 'https://sample-test/api/events/trackWebPushClick' }

    it 'with valid payload it succeeds' do
      stub_request(:post, web_push_url).to_return(status: 200)
      user = create(:user)
      event = create(:event, user: user)

      response = IterableApi.new(api_key, base_url).track_web_push_click(user, event)

      expect(a_request(:post, web_push_url)).to have_been_made
      expect(response.code).to eq(200)
    end

    it 'with invalid payload fails' do
      stub_request(:post, web_push_url).to_raise(RestClient::ExceptionWithResponse)
      user = create(:user)
      event = create(:event, user: user)

      expect { IterableApi.new(api_key, base_url).track_web_push_click(user, event) }.to raise_error(FailedEventTracking)
    end
  end
end