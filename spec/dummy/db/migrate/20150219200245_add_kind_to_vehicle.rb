class AddKindToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :kind, :string
  end
end
