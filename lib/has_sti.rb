require 'has_sti/active_record_extensions'
require 'has_sti/exceptions'

module HasSti
  class ActiveRecord::Base
    extend HasSti::ActiveRecordExtensions
  end
end
