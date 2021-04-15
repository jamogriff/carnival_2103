require './lib/ride'
require './lib/attendee'
require './lib/carnival'

RSpec.describe Carnival do

  describe 'initialization and rides' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    it 'exists' do
      expect(jeffco_fair).to be_instance_of(Carnival)
    end

    it 'accesses its attributes' do
      expect(jeffco_fair.name).to eq("Jefferson County Fair")
      expect(jeffco_fair.rides).to be_instance_of(Array)
    end

    it 'can add rides' do
      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)
      expect(jeffco_fair.rides.length).to eq(3)
    end

  end
end
