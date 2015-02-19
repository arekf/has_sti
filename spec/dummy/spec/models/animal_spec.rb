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

  describe 'scope' do
    before do
      @nice_cat = Cat.create
      @sleepy_cat = Cat.create

      @cute_elephant = Elephant.create
      @helpful_elephant = Elephant.create

      @beautiful_zebra = Zebra.create
      @awesome_zebra = Zebra.create
    end

    it 'should respond to cat scope' do
      expect(Animal).to respond_to(:cat)
    end

    it 'should respond to elephant scope' do
      expect(Animal).to respond_to(:elephant)
    end

    it 'should respond to zebra scope' do
      expect(Animal).to respond_to(:zebra)
    end

    it 'should return cats' do
      expect(Animal.cat).to match_array [@nice_cat, @sleepy_cat]
    end

    it 'should return elephants' do
      expect(Animal.elephant).to match_array [@cute_elephant, @helpful_elephant]
    end

    it 'should return zebras' do
      expect(Animal.zebra).to match_array [@beautiful_zebra, @awesome_zebra]
    end
  end
end
