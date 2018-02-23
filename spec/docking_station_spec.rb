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
