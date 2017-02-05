class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins
      t.integer :user_id
      t.text :appeal
      t.string :photo_url
      t.string :website

      t.timestamps
    end
  end
