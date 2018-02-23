require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe DockingStation do
  it 'responds to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it ':release_bike returns a new bike' do
    dummy_bike = double(:working => true)
    subject.dock_bike(dummy_bike)
    expect(subject.release_bike).to eq(dummy_bike)
  end

  it ':release_bike does not return a bike if no bikes are present' do
    expect { subject.release_bike }.to raise_error(RuntimeError)
  end

  it ':dock_bike does not add a bike if 20 bikes are present' do
    dummy_bike = double()
    DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(dummy_bike) }
    expect { subject.dock_bike(dummy_bike) }.to raise_error(RuntimeError)
  end

  it ':dock_bike adds a bike' do
    dummy_bike = double()
    expect(subject.dock_bike(dummy_bike)).to eq(dummy_bike)
  end

  it ':capacity to equal 21' do
    docking_station = DockingStation.new(21)
    expect(docking_station.capacity).to eq(21)
  end

  it 'should not release bike if not working' do
    dummy_bike = double(:working => false)
    subject.dock_bike(dummy_bike)
    expect { subject.release_bike }.to raise_error(RuntimeError)
  end
end

describe Van do

  describe '#recieve_working_bike' do
    it 'takes a working bike from a garage' do

    end
  end

  describe '#recieve_broken_bike' do
    it 'takes a broken bike from a docking station' do

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

describe Garage do

  describe '#recieve_broken_bike' do
    it 'recieves a broken bike from a van' do

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
