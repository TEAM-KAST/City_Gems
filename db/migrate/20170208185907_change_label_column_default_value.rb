class ChangeLabelColumnDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :tags, :label, :string, :default => "No Tag"
  end
end
