class Animal < ActiveRecord::Base
  has_sti :cat, :elephant, :zebra
end
