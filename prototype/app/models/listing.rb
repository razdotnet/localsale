class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :offers
	has_many :questions
end