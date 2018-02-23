require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Van do

  describe '#recieve_working_bike' do
    it 'takes a working bike from a garage' do
      dummy_bike = double(:working => true)
      dummy_garage = double(:release_bike => dummy_bike)
      subject.recieve_working_bike(dummy_garage)
      expect(subject.bikes_in_storage[0].working).to eq true
    end
  end

  describe '#recieve_broken_bike' do
    it 'takes a broken bike from a docking station' do
      dummy_bike = double(:working => false)
      dummy_docking_station = double(:release_broken_bike => dummy_bike)
      subject.recieve_broken_bike(dummy_docking_station)
      expect(subject.bikes_in_storage[0].working).to eq false
    end
  end

  describe '#deliver_working_bike' do
    it 'delivers a working bike to a docking station' do

    end
  end

  describe '#deliver_broken_bike' do
    it 'delivers a broken bike to a garage' do

    end
  end

end
