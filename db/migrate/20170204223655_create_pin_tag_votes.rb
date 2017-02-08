class CreatePintagVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :pintag_votes do |t|
      t.integer :pin_tag_id
      t.integer :user_id

      t.timestamps
    end
  end
end
