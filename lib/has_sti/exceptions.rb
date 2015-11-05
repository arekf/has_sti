module HasSti
  module Exceptions
    class NoDescendantsError < StandardError
      def message
        'You have not provided STI descendants for has_sti'
      end
    end
  end
end
