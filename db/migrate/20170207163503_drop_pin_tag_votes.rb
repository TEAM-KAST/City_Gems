class DropPinTagVotes < ActiveRecord::Migration[5.0]
  def change
    drop_table :pin_tag_votes    
  end
end
