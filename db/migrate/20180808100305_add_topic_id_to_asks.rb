class AddTopicIdToAsks < ActiveRecord::Migration[5.0]
  def change
  	    add_column :asks, :topic_id, :integer

  end
end
