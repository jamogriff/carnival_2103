require './lib/ride'
require './lib/attendee'
require './lib/carnival'

RSpec.describe Carnival do

  describe 'initialization and rides' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)

    it 'exists' do
      expect(jeffco_fair).to be_instance_of(Carnival)
    end

    it 'accesses its attributes' do
      expect(jeffco_fair.name).to eq("Jefferson County Fair")
      expect(jeffco_fair.rides).to be_instance_of(Array)
    end

    it 'can add rides' do
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)
      expect(jeffco_fair.rides.length).to eq(3)
    end

    it 'can recommend rides' do
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')
      sally.add_interest('Scrambler')
      bob_expected = [ferris_wheel, bumper_cars]
      sally_expected = [scrambler]

      expect(jeffco_fair.recommend_rides(bob)).to eq(bob_expected)
      expect(jeffco_fair.recommend_rides(sally)).to eq(sally_expected)
    end
  end

  describe 'iteration 3' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    jeffco_fair.attendees
    bob = Attendee.new("Bob", 0)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally = Attendee.new('Sally', 20)
    sally.add_interest('Bumper Cars')
    johnny = Attendee.new("Johnny", 5)
    johnny.add_interest('Bumper Cars')

    it 'sorts attendees by ride interest' do
      expect(carnival.attendees_by_ride_interest).to be_instance_of(Hash)
      expect(carnival.attendees_by_ride_interest[bumper_cars].length).to eq(3)
    end
end
