class Van
  attr_reader :bikes_in_storage


  def initialize
    @bikes_in_storage = []
  end

  def recieve_working_bike(garage)
    @bikes_in_storage.push(garage.release_bike)
  end

  def recieve_broken_bike(station)
    @bikes_in_storage.push(station.release_broken_bike)
  end

  def deliver_working_bike

  end

  def deliver_broken_bike

  end

end
