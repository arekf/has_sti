require 'rails_helper'

RSpec.describe :two_wheeled_vehicle, :type => :model do
  before do
    @two_wheeled_vehicle = TwoWheeledVehicle.new
  end

  it 'should respond to two_wheeled_vehicle?' do
    expect(@two_wheeled_vehicle).to respond_to(:two_wheeled_vehicle?)
  end

  it 'should be two wheeled vehicle' do
    expect(@two_wheeled_vehicle).to be_two_wheeled_vehicle
  end
end
