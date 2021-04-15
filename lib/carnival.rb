class Carnival
  attr_reader :name, :rides, :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def admit(person)
    @attendees << person
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
    @rides.find do |ride|
      ride.name == name
    end
  end

  def get_ride_names
    @rides.map do |ride|
      ride.name
    end
  end

  # NOTE: Method returns duplicate instances of attendees
  def attendees_by_ride_interest
    hash = {}
    @rides.each do |ride|
      @attendees.each do |attendee|
        attend_intr = turn_interests_into_rides(attendee.interests)
        if attend_intr.include?(ride)
          # Should use a different method of checking
          # whether attendant exists as value instead
          # of just the key, since keys won't duplicate. 
          if hash.key?(ride)
            hash[ride] << attendee
          elsif
            hash[ride] = [attendee]
          end
        end
      end
    end
    hash
  end

  def turn_interests_into_rides(interests)
    rides = []
    interests.each do |interest|
      @rides.each do |ride|
        if interest == ride.name
          rides << ride
        end
      end
    end
    rides
  end


end
