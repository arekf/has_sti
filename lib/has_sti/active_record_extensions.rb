module HasSti
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    # Creates STI helper methods and scopes. Use it in your parent model, for example:
    #    class Cat < Animal; end
    #    class Dog < Animal; end
    #    class Parrot < Animal; end
    #
    #    class Animal < ActiveRecord::Base
    #        has_sti :cat, :dog, :parrot
    #    end
    #
    # Helper methods will be created:
    #
    #    cat = Cat.first
    #    cat.cat? => true
    #    cat.parrot? => false
    #
    # Also, you can use scopes on parent model, like:
    #    Animal.cat => array of Cats
    #
    # If you do not need helper methods, or scopes, just disable them:
    #    class Animal < ActiveRecord::Base
    #        has_sti :cat, :dog, :parrot, helper_methods: false
    #    end
    #
    # or:
    #    class Animal < ActiveRecord::Base
    #        has_sti :cat, :dog, :parrot, scopes: false
    #    end
    def has_sti(*klasses, helper_methods: true, scopes: true)
      return if !helper_methods && !scopes

      raise HasSti::Exceptions::NoDescendantsError if klasses.count.zero?

      klasses.each do |klass|
        define_helper_method(klass) if helper_methods
        define_scope(klass) if scopes
      end
    end

    private

    def define_helper_method(klass)
      define_method helper_method_name(klass) do
          self.class.name == klass.to_s.classify
        end
    end

    def define_scope(klass)
      define_singleton_method scope_method_name(klass) do
        where(self.inheritance_column => class_name(klass))
      end
    end

    def class_name(klass)
      klass.to_s.classify
    end

    def helper_method_name(klass)
      "#{klass.to_s.underscore}?"
    end

    def scope_method_name(klass)
      klass.to_s.underscore
    end
  end
end
