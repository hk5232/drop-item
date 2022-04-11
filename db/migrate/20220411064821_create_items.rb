class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :explanation, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :color, null: false
      t.text :feature
      add_column :studios, :latitude, :float
      add_column :studios, :longitude, :float
      t.timestamps
    end
  end
end
