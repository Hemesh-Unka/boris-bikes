require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Garage do

  describe '#recieve_broken_bike' do
    it 'recieves a broken bike from a van' do
      dummy_bike = double(:working => false)
      subject.recieve_broken_bike(dummy_bike)
      expect(subject.bikes_in_storage[0].working).to eq false
    end
  end

  describe '#fix_bike' do
    it 'fixes a broken bike' do

    end
  end

  describe '#release_bike' do
    it 'releases a working bike into the van' do

    end
  end

end
