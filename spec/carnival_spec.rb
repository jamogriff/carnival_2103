require './lib/ride'
require './lib/attendee'
require './lib/carnival'

RSpec.describe Carnival do

  describe 'initialization' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    it 'exists' do
      expect(jeffco_fair).to be_instance_of(Carnival)
    end

    it 'accesses its attributes' do
      expect(jeffco_fair.name).to eq("Jefferson County Fair")
      expect(jeffco_fair.rides).to be_instance_of(Array)
    end
    
  end
end
