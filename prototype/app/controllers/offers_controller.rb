class OffersController < ApplicationController
	def new
		@offer = Offer.new
	end

	def index
		@listing = current_user.listings
		@sent_offers = Offer.where(user_id: current_user.id)
	end

	def create
		user = current_user
		listing = Listing.find(params[:listing_id])
		@offer = listing.offers.build offer_params

		if @offer.save
			redirect_to root_url, notice: 'create listing'
		end
	end

	def reject
		offer = Offer.find(params[:id])
		offer.update_attributes(status: 1)
		offer.save!
		redirect_to root_url, notice: 'yea?'
	end

	def accept
		offer = Offer.find(params[:id])
		offer.update_attributes(status: 2)
		offer.save!
		redirect_to root_url, notice: 'Accepted offer.'
	end
	private

		def offer_params
			params.require(:offer).permit(:price, :user_id, :listing_id)
		end
end