class Ask < ApplicationRecord
	belongs_to :topic
	belongs_to :user
	has_many :replies, dependent: :destroy
	

	validates :title, :content, :topic_id, presence: true
end
