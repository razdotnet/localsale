class Question < ActiveRecord::Base
	belongs_to :user
	has_one :reply
	belongs_to :listing
end