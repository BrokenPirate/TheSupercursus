class AddAskAndTopicReferences < ActiveRecord::Migration[5.0]
  def change
  	add_reference :asks, :topic, index: true
  	rename_column :replies, :askreply, :reply
  end
end
