class Offer < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user

	enum status: [:in_process, :rejected, :accepted]
end