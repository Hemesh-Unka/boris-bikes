require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Van do

  describe '#recieve_working_bike' do
    it 'takes a working bike from a garage' do
      dummy_bike = double(:working => true)
      dummy_garage = double(:release_bike => dummy_bike)
      subject.receive_working_bike(dummy_garage)
      expect(subject.bikes_in_storage[0].working).to eq true
    end
  end

  describe '#recieve_broken_bike' do
    it 'takes a broken bike from a docking station' do
      dummy_bike = double(:working => false)
      dummy_docking_station = double(:release_broken_bike => dummy_bike)
      subject.receive_broken_bike(dummy_docking_station)
      expect(subject.bikes_in_storage[0].working).to eq false
    end
  end

  describe '#select_working_bike' do
    it 'selects a working bike from its inventory' do
      dummy_bike = double(:working => true)
      dummy_garage = double(:release_bike => dummy_bike)
      subject.receive_working_bike(dummy_garage)
      expect(subject.select_working_bike.working).to eq true
    end
  end

  describe '#deliver_working_bike' do
    it 'delivers a working bike to a docking station' do
      dummy_bike = double(:working => true)
      docking_station = DockingStation.new

      dummy_garage = double(:release_bike => dummy_bike)
      subject.receive_working_bike(dummy_garage)

      subject.deliver_working_bike(docking_station)

      expect(docking_station.bikes[0].working).to eq true
    end
  end

  describe '#select_broken_bike' do
    it 'selects a broken bike from its inventory' do
      dummy_bike = double(:working => false)
      dummy_station = double(:release_broken_bike => dummy_bike)
      subject.receive_broken_bike(dummy_station)
      expect(subject.select_broken_bike.working).to eq false
    end
  end

  describe '#deliver_broken_bike' do
    it 'delivers a broken bike to a garage' do
      dummy_bike = double(:working => false)
      garage = Garage.new

      dummy_station = double(:release_broken_bike => dummy_bike)
      subject.receive_broken_bike(dummy_station)

      subject.deliver_broken_bike(garage)
      expect(garage.bikes_in_storage[0].working).to eq false
    end
  end

end
