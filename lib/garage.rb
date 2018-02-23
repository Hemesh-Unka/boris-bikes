class Garage
  attr_reader :bikes_in_storage

  def initialize
    @bikes_in_storage = []
  end

  def recieve_broken_bike(bike)
    fail 'Bike received is actually working!' if bike.working
    @bikes_in_storage.push(bike)
  end
end
