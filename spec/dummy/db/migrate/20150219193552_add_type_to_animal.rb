class AddTypeToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :type, :string
  end
end
