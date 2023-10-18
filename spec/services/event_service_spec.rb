require 'rails_helper'

describe 'EventService' do
  let(:user) { create(:user) }

  context 'when event is created' do
    it 'creates persists event' do
      iterable_api = IterableApi.new('api_key', "https://sample-test/api")
      expect(iterable_api).to receive(:track_web_push_click)
      expect(iterable_api).to receive(:send_email)

      EventService.new(iterable_api).create(user, { name: 'NewEvent' })

      expect(Event.find_by(name: 'NewEvent')).to_not be_nil
    end
  end
end