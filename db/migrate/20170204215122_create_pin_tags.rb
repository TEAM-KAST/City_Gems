class CreatePinTags < ActiveRecord::Migration[5.0]
  def change
    create_table :pin_tags do |t|
      t.references :pin, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
