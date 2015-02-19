require 'rails_helper'

RSpec.describe Animal, :type => :model do
  before do
    @animal = Animal.new
  end

  it 'should respond to cat?' do
    expect(@animal).to respond_to(:cat?)
  end

  it 'should respond to elephant?' do
    expect(@animal).to respond_to(:elephant?)
  end

  it 'should respond to zebra?' do
    expect(@animal).to respond_to(:zebra?)
  end

  it 'should not be a cat' do
    expect(@animal).not_to be_cat
  end

  it 'should not be an elephant' do
    expect(@animal).not_to be_elephant
  end

  it 'should not be a zebra' do
    expect(@animal).not_to be_zebra
  end
end
