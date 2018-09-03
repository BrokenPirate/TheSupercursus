class Topic < ApplicationRecord
	belongs_to :ask

	has_many :asks
	has_many :users, through: :asks
end
