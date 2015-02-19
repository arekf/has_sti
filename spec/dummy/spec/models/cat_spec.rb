require 'rails_helper'

RSpec.describe Cat, :type => :model do
  before do
    @cat = Cat.new
  end

  it 'should respond to cat?' do
    expect(@cat).to respond_to(:cat?)
  end

  it 'should respond to elephant?' do
    expect(@cat).to respond_to(:elephant?)
  end

  it 'should respond to zebra?' do
    expect(@cat).to respond_to(:zebra?)
  end

  it 'should be a cat' do
    expect(@cat).to be_cat
  end

  it 'should not be an elephant' do
    expect(@cat).not_to be_elephant
  end

  it 'should not be a zebra' do
    expect(@cat).not_to be_zebra
  end
end
