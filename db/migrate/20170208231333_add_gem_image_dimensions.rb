class AddGemImageDimensions < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :width, :string
    add_column :pins, :height, :string
  end
end
