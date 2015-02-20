require 'rails_helper'

RSpec.describe Language, :type => :model do
  before(:each) do
    Language.instance_eval do
      undef_method :slavic_language if method_defined? :slavic_language
      undef_method :slavic_language? if method_defined? :slavic_language?
    end
  end

  it 'should not create helper methods when option disables them' do
    Language.class_eval do
      has_sti :slavic_language, helper_methods: false
    end

    expect(Language.new).not_to respond_to(:slavic_language?)
    expect(Language).to respond_to(:slavic_language)
  end

  it 'should not create scopes when option disables them' do
    Language.class_eval do
      has_sti :indo_euroupean_language, scopes: false
    end

    expect(Language.new).to respond_to(:indo_euroupean_language?)
    expect(Language).not_to respond_to(:indo_euroupean_language)
  end
end
