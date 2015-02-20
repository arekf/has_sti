require 'rails_helper'

RSpec.describe :has_sti do
  it 'should raise when models are not provided' do
    expect {
      Class.new(ActiveRecord::Base) do
        has_sti
      end
    }.to raise_error(HasSti::Exceptions::NoDescendantsError)
  end

  it 'should raise when model has no parent model as a superclass' do
    expect {
      Class.new(ActiveRecord::Base) do
        has_sti :string
      end
    }.to raise_error(HasSti::Exceptions::NoSuperclassError)
  end

  it 'should not raise when options disable all the behavior' do
    expect {
      Class.new(ActiveRecord::Base) do
        has_sti :string, helper_methods: false, scopes: false
      end
    }.not_to raise_exception
  end
end
