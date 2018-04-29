require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    # in IRB, when more than 10 bikes, it removes all the bikes
    fail 'No bikes available' if empty?
    puts return_broken_bikes[0]
    @bikes.delete(return_working_bikes[0])
  end

  def release_broken_bike
    fail 'No broken bikes available' if no_broken?
    @bikes.delete(return_broken_bikes[0])
  end

  def dock_bike(bike)
    fail 'Not enough space available' if full?
    @bikes.push(bike)[-1]
  end

  private
  def empty?
    return true if return_working_bikes.empty?
    false
  end

  def no_broken?
    return true if return_broken_bikes.empty?
    false
  end

  def full?
    @bikes.length >= @capacity
  end

  def return_working_bikes
    @bikes.select { |bike| bike.working == true }
  end

  def return_broken_bikes
    @bikes.select { |bike| bike.working == false }
  end
end
