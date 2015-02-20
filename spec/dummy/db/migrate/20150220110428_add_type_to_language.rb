class AddTypeToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :type, :string
  end
end
