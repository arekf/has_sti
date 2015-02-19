module HasSti
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    def has_sti(*klasses)
      klasses.each do |klass|
        define_method helper_method_name(klass) do
          self.class.name == klass.to_s.classify
        end
      end
    end

    private

    def helper_method_name(klass)
      "#{klass.to_s.underscore}?"
    end
  end
end
