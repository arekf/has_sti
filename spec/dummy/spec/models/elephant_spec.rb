require 'rails_helper'

RSpec.describe Elephant, :type => :model do
  before do
    @elephant = Elephant.new
  end

  it 'should respond to cat?' do
    expect(@elephant).to respond_to(:cat?)
  end

  it 'should respond to elephant?' do
    expect(@elephant).to respond_to(:elephant?)
  end

  it 'should respond to zebra?' do
    expect(@elephant).to respond_to(:zebra?)
  end

  it 'should not be a cat' do
    expect(@elephant).not_to be_cat
  end

  it 'should be an elephant' do
    expect(@elephant).to be_elephant
  end

  it 'should not be a zebra' do
    expect(@elephant).not_to be_zebra
  end
end
