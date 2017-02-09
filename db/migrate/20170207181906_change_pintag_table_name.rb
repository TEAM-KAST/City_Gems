class ChangePintagTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :pin_tags, :pintags
  end
end
