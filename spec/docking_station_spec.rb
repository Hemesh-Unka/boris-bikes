require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe DockingStation do
  let(:dummy_bike) { double :dummy_bike }

  describe ':release_bike' do
    it ':release_bike returns a new bike' do
      dummy_bike = double(:working => true)
      subject.dock_bike(dummy_bike)
      expect(subject.release_bike).to eq(dummy_bike)
    end

    it 'returns a new bike' do
      allow(dummy_bike).to receive(:working?).and_return(true)
      allow(dummy_bike).to receive(:working).and_return(true)
      subject.dock_bike(dummy_bike)
      expect(subject.release_bike).to be_working
    end

    it 'does not return a bike if no bikes are present' do
      expect { subject.release_bike }.to raise_error(RuntimeError)
    end

    it 'should not release bike if not working' do
      allow(dummy_bike).to receive(:working?).and_return(true)
      allow(dummy_bike).to receive(:working).and_return(false)
      subject.dock_bike(dummy_bike)
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
  end

  describe ':dock_bike' do
    it 'does not add a bike if 20 bikes are present' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike double(:bike) }
      expect { subject.dock_bike double(:bike) }.to raise_error(RuntimeError)
    end

    it 'adds a bike' do
      allow(dummy_bike).to receive(:is_a?).with(Bike).and_return(true)
      expect(subject.dock_bike(dummy_bike)).is_a?(Bike)
    end
  end

  describe ':capacity' do
    it 'to equal 21' do
      docking_station = DockingStation.new(21)
      expect(docking_station.capacity).to eq(21)
    end

    it 'should not release bike if not working' do
      dummy_bike = double(:working => false)
      subject.dock_bike(dummy_bike)
      expect { subject.release_bike }.to raise_error(RuntimeError)
    end

    it 'should release bike a broken bike if asked' do
      dummy_bike = double(:working => false)
      subject.dock_bike(dummy_bike)
      expect(subject.release_broken_bike.working).to eq(false)
    end
  end
end
