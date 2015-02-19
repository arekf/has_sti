class CreateZebras < ActiveRecord::Migration
  def change
    create_table :zebras do |t|

      t.timestamps null: false
    end
  end
end
