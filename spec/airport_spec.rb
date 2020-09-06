require 'airport'

describe Airport do
  
  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error when airport is full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error "Landing is not currently possible"
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off from an airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'raises an error if no planes available' do
      plane = Plane.new
      expect{ subject.take_off(plane) }.to raise_error "There are no planes available"
    end
  end
  
end



