class Carnival
  attr_reader :name, :rides

  def initialize(name)
    @name = name
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    included_names = attendee.interests.select do |interest|
      get_ride_names.include?(interest)
    end
    included_names.flat_map do |name|
      get_ride_from_name(name)
    end.uniq
  end

  # NOTE: The following two helper methods
  # don't have associated tests
  def get_ride_from_name(name)
    @rides.select do |ride|
      ride.name == name
    end
  end

  def get_ride_names
    @rides.map do |ride|
      ride.name
    end
  end

end
