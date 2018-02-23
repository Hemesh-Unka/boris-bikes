class Garage
  attr_reader :bikes_in_storage

  def initialize
    @bikes_in_storage = []
  end

  def receive_broken_bike(bike)
    fail 'Bike received is actually working!' if bike.working
    @bikes_in_storage.push(bike)
  end

  def fix_bikes
    @bikes_in_storage.each do |bike|
      bike.working = true
    end
  end

  
end
