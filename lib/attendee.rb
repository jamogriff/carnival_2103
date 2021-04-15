class Attendee
  attr_reader :name, :spending_money, :interests

  def initialize(name, age)
    @name = name
    @spending_money = age
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end
  
end
