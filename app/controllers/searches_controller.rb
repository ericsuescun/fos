class SearchesController < ApplicationController
	
	def index
		@questions = Question.where("title like ?", "%#{params[:search]}%")
	end

	private
		def searches_params
			params.require(:searches).permit(:search)
		end
end
