module HasSti
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    def has_sti(*klasses)
      raise HasSti::Exceptions::NoDescendantsError if klasses.count.zero?

      superclass = constant(klasses.first).superclass
      raise HasSti::Exceptions::NoSuperclassError unless superclass

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
