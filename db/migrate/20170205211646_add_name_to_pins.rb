class AddNameToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :name, :string
  end
end
