class AddAskIdToReplies < ActiveRecord::Migration[5.0]
  def change
    add_column :replies, :ask_id, :integer
  end
end
