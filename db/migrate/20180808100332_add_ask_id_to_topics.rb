class AddAskIdToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :ask_id, :integer
  end
end
