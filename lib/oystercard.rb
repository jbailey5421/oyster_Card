class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys
  def initialize 
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end
  def touch_in(station)
   fail 'Insufficient balance to touch in' if balance < MINIMUM_CHARGE
   @in_journey = true
   @entry_station = station
   @journeys << { entry: station, exit: nil }
  end
  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end
end
private 
  def deduct(amount)
    @balance -= amount
  end