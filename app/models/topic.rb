class Topic < ApplicationRecord

	has_many :asks
	has_many :users, through: :asks
end
