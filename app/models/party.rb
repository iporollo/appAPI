class Party < ApplicationRecord
	belongs_to :user
	has_many :songs
	has_many :members
end
