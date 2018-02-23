class Van
  attr_reader :bikes_in_storage

  def initialize
    @bikes_in_storage = []
  end

  def receive_working_bike(garage)
    @bikes_in_storage.push(garage.release_bike)
  end

  def receive_broken_bike(station)
    @bikes_in_storage.push(station.release_broken_bike)
  end

  def select_working_bike
    @bikes_in_storage.each_with_index do |bike, index|
      return @bikes_in_storage.delete_at(index) if bike.working
    end
  end

  def deliver_working_bike(station)
    station.dock_bike(select_working_bike)
  end

  def select_broken_bike
    @bikes_in_storage.each_with_index do |bike, index|
      return @bikes_in_storage.delete_at(index) unless bike.working
    end
  end

  def deliver_broken_bike(garage)
    garage.recieve_broken_bike(select_broken_bike)
  end
end
