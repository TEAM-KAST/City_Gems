class Name < ActiveRecord::Migration[5.0]
  def self.up
    add_column :pins, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :pins, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
