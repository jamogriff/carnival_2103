class Attendee
  attr_reader :name, :spending_money, :interests

  def initialize(name, age)
    @name = name
    @spending_money = age
    @interests = []
  end

end
