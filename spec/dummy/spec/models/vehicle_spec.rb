require 'rails_helper'

RSpec.describe Vehicle, :type => :model do
  before do
    @vehicle = Vehicle.new
  end

  it 'should respond to two_wheeled_vehicle?' do
    expect(@vehicle).to respond_to(:two_wheeled_vehicle?)
  end

  describe 'scope' do
    before do
      @anitque_bike = TwoWheeledVehicle.create
      @speedy_segway = TwoWheeledVehicle.create
    end

    it 'should respond to two wheeled vehicle scope' do
      expect(Vehicle).to respond_to(:two_wheeled_vehicle)
    end

    it 'should return two wheeled vehicles' do
      expect(Vehicle.two_wheeled_vehicle).to match_array [@anitque_bike, @speedy_segway]
    end
  end
end
