require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation' do
    describe 'name' do
      it 'should fail when the name of the event is empty' do
        event_without_name = build(:event, name: '')
        expect(event_without_name).to_not be_valid
      end

      it 'should pass when the name of the event is present' do
        event_with = build(:event, name: 'A')
        expect(event_with).to be_valid
      end
    end

    describe 'user' do
      it 'should fail when the user is empty' do
        event_without_user = build(:event, user: nil)
        expect(event_without_user).to_not be_valid
      end
      it 'should pass when the user is present' do
        event_without_user = build(:event)
        expect(event_without_user).to be_valid
      end
    end
  end
end
