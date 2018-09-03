class FixTopicColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :topics, :topic_id
  	rename_column :topics, :topic, :name
  end
end
