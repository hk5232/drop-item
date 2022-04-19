class ChangeDataNull < ActiveRecord::Migration[6.0]
  def up
    change_column :items, :studios,:float, null: true 
    change_column :items, :latitude,:float, null: true 
  end

  def down
    change_column :items, :studios,:float, null: false 
    change_column :items, :latitude,:float, null: false 
end
end
