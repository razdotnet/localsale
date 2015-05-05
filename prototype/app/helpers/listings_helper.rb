module ListingsHelper
	def creator?(listing)
		if user_signed_in? 
			listing.user.id == current_user.id 
		end
	end
end