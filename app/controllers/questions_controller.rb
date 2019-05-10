class QuestionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.user = current_user
		if @question.save
			redirect_to questions_path, notice: "La pregunta fue publicada con éxito"
		else
			render :new
		end
	end

	def show
		@question = Question.find(params[:id])
		@answer = @question.answers
		# @answer = Answer.new
	end

	def edit
	  @question = Question.find(params[:id])
	end

	def update
	  	@question = Question.find(params[:id])
	  	if @question.update(question_params)
	    	redirect_to questions_path, notice: "La pregunta ha sido editada!"
	  	else
	    	render :edit
	  	end
	end

	def destroy
		question = Question.find(params[:id])
		question.destroy

		redirect_to questions_path, notice: "La pregunta fue eliminada con éxito"
	end

	private
	  def question_params
	    params.require(:question).permit(:title, :description)
	  end
end
