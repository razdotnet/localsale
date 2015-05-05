class ListingsController < ApplicationController

	before_action :find_listing, only: [:show]
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@listing = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		user = current_user
		@listing = user.listings.new(listing_params)

		if @listing.save
			redirect_to root_url, notice: 'Created listing'
		else
			render('new')
			flash[:notice] = 'Failed to create listing'
		end
	end

	private

		def find_listing
			@listing = Listing.find(params[:id])
		end

		def listing_params
			params.require(:listing).permit(:title)
		end
end