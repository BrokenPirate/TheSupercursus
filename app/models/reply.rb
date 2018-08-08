class Reply < ApplicationRecord
	belongs_to :ask
	belongs_to :user

	validates :reply, presence: true 
end
