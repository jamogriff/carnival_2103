require './lib/attendee'

RSpec.describe Attendee do

  describe 'initialization and interests' do
    attendee = Attendee.new('Bob', 20)

    it 'exists' do
      expect(attendee).to be_instance_of(Attendee)
    end

    it 'accesses its attributes' do
      expect(attendee.name).to eq("Bob")
      expect(attendee.spending_money).to eq(20)
      expect(attendee.interests).to be_instance_of(Array)
    end

    it 'can add interests' do
      attendee.add_interest('Bumper Cars')
      attendee.add_interest('Ferris Wheel')
      expect(attendee.interests.length).to eq(2)
    end
  end
end
