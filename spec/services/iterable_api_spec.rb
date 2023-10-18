require 'rails_helper'
require 'webmock/rspec'

describe 'IterableApi' do
  let(:api_key) { 'dummy_api_key' }
  let(:base_url) { 'https://sample-test/api' }
  let(:user) { create(:user) }

  describe '#track_web_push_click' do
    let(:web_push_url) { 'https://sample-test/api/events/trackWebPushClick' }

    it 'with valid payload it succeeds' do
      stub_request(:post, web_push_url).to_return(status: 200)
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

  describe '#send_email' do
    let(:email_url) { "#{base_url}/email/target" }
    it 'sends an email' do
      stub_request(:post, email_url).to_return(status: 200)
      current_time = Time.now
      Timecop.freeze(current_time)

      response = IterableApi.new(api_key, base_url).send_email(user)

      expect(a_request(:post, email_url)).to have_been_made
      expect(response.code).to eq(200)
      Timecop.return
    end

    it 'with invalid payload fails' do
      stub_request(:post, email_url).to_raise(RestClient::ExceptionWithResponse)
      user = create(:user)

      expect { IterableApi.new(api_key, base_url).send_email(user) }.to raise_error(FailedToSendEmail)
    end
  end
end