class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = Question.new question_params

		if @question.save
			redirect_to root_path, notice: 'sent question'
		else
			render('new')
			flash[:notice] = 'failed'
		end
	end

	private

		def question_params
			params.require(:question).permit(:question, :user_id, :listing_id)
		end
end