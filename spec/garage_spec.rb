require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Garage do

  describe '#receive_broken_bike' do
    it 'receives a broken bike from a van' do
      dummy_bike = double(:working => false)
      subject.receive_broken_bike(dummy_bike)
      expect(subject.bikes_in_storage[0].working).to eq false
    end
  end

  describe '#fix_bikes' do
    it 'fixes a broken bike' do
      bike = Bike.new
      bike.working = false
      subject.receive_broken_bike(bike)
      subject.fix_bikes
      expect(subject.bikes_in_storage[0].working).to eq true
    end
  end

  # describe '#release_bike' do
  #   it 'releases a working bike into the van' do
  #     dummy_bike = double(:working => false)
  #     subject.receive_broken_bike(dummy_bike)
  #
  #     subject.fix(dummy_bike)
  #
  #     expect()
  #   end
  #end

end
