class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :explanation, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :color, null: false
      t.text :feature
      t.float :latitude, null: false
      t.float :studios, null: false
      t.timestamps
    end
  end
end
