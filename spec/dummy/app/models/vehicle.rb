class Vehicle < ActiveRecord::Base
  self.inheritance_column = 'kind'

  has_sti :two_wheeled_vehicle
end
