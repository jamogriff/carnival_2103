require './lib/attendee'

RSpec.describe Attendee do

  describe 'initialization' do
    attendee = Attendee.new('Bob', 20)

    it 'exists' do
      expect(attendee).to be_instance_of(Attendee)
    end

    it 'accesses its attributes' do
      expect(attendee.name).to eq("Bob")
      expect(attendee.spending_money).to eq(20)
    end
  end
end
