module DashboardsHelper
	def questions?(questions)
		if questions.reply
			questions.reply.reply
		else
			render 'replies/form', question: questions.id
		end
	end

	def currency(price)
		number_to_currency(price)
	end

	def status?(offer)
		if offer.accepted? || offer.rejected?
			"Offer has been	" + offer.status
		else
			link_to 'reject offer', reject_offer_path(offer), method: :post 
			link_to 'accept offer', accept_offer_path(offer), method: :post		
		end
	end
end