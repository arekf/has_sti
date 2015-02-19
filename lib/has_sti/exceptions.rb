module HasSti
  module Exceptions
    class NoDescendantsError < StandardError
      def message
        'You have not provided STI descendants for has_sti'
      end
    end
    class NoSuperclassError < StandardError
      def message
        'Your STI model has no parent model as a superclass'
      end
    end
  end
end
