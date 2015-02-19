require 'rails_helper'

RSpec.describe Zebra, :type => :model do
  before do
    @zebra = Zebra.new
  end

  it 'should respond to cat?' do
    expect(@zebra).to respond_to(:cat?)
  end

  it 'should respond to elephant?' do
    expect(@zebra).to respond_to(:elephant?)
  end

  it 'should respond to zebra?' do
    expect(@zebra).to respond_to(:zebra?)
  end

  it 'should not be a cat' do
    expect(@zebra).not_to be_cat
  end

  it 'should not be an elephant' do
    expect(@zebra).not_to be_elephant
  end

  it 'should be a zebra' do
    expect(@zebra).to be_zebra
  end
end
