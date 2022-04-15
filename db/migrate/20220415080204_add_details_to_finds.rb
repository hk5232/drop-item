class AddDetailsToFinds < ActiveRecord::Migration[6.0]
  def change
    add_column :finds, :comment, :text
  end
end
