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
    # Helper methods will be created:
    #    cat = Cat.first
    #    cat.cat? => true
    #    cat.parrot? => false
    # Also, you can use scopes on parent model, like:
    #    Animal.cat => array of Cats
    def has_sti(*klasses)
      raise HasSti::Exceptions::NoDescendantsError if klasses.count.zero?

      superclass = constant(klasses.first).superclass
      active_record_superclasses = [ActiveRecord::Base, Object, BasicObject]

      raise HasSti::Exceptions::NoSuperclassError if superclass.nil? || active_record_superclasses.include?(superclass)

      klasses.each do |klass|
        define_method helper_method_name(klass) do
          self.class.name == klass.to_s.classify
        end

        superclass.define_singleton_method scope_method_name(klass) do
          where(superclass.inheritance_column => class_name(klass))
        end
      end
    end

    private

    def class_name(klass)
      klass.to_s.classify
    end

    def constant(klass)
      class_name(klass).constantize
    end

    def helper_method_name(klass)
      "#{klass.to_s.underscore}?"
    end

    def scope_method_name(klass)
      klass.to_s.underscore
    end
  end
end
