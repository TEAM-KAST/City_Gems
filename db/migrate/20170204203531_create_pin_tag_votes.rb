class CreatePinTagVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :pin_tag_votes do |t|
      t.integer pintag_id
      t.integer user_id
      t.timestamps
    end
  end
end
