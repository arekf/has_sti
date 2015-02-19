class CreateElephants < ActiveRecord::Migration
  def change
    create_table :elephants do |t|

      t.timestamps null: false
    end
  end
end
