 class Course < ApplicationRecord



	validates :name, presence: true, uniqueness: true
	validates :url, presence: true, uniqueness: true 
	validates :tagline, presence: true
	validates :category, inclusion: { in: %w(business coaching cooking education construction ecology marketing management coding webdevelopment finances health hospitality travel sport photography videomaking),
    message: "%{value} is not a valid category" }

    acts_as_commentable
    has_attachment :photo
    belongs_to :user
    has_many :upvotes
end
