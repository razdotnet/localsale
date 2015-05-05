class RepliesController < ApplicationController
	def new
		@reply = Reply.new
	end

	def create
		@reply = Reply.new reply_params

		if @reply.save
			redirect_to root_url, notice: 'Created reply'
		else
			flash[:notice] = 'Failed to create reply'
			render('new')
		end
	end

	private

		def reply_params
			params.require(:reply).permit(:reply, :question_id)
		end
end