class DashboardsController < ApplicationController 
	before_filter :signed_in?

	def show
		user = current_user

		@listings = user.listings
		@offers = Offer.all
		@questions = user.questions
	end

	private

	def signed_in?
		unless user_signed_in?
			redirect_to root_url, notice: 'You need to sign in to view your dashboard'
		end
	end
end