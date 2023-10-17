require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    it 'should fail when the name of the event is empty' do
      event_without_name = build(:event, name: '')
      expect(event_without_name).to_not be_valid
    end

    it 'should pass when the name of the event is present' do
      event_with = build(:event, name: 'A')
      expect(event_with).to be_valid
    end
  end
end
