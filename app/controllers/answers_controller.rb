class AnswersController < ApplicationController

	def create
	  question = Question.find(params[:question_id])

	  unless answers_params[:body] == ""
	  	question.answers.create(answers_params)
	  	redirect_to question, notice: "Respuesta publicada!"
	  else
	  	redirect_to question, notice: "Respuesta vacía! Escribe algo por favor."

	  end
	end

	def show
		redirect_to question_url
	end

	private
	  def answers_params
	    params.require(:answer).permit(:body).merge(user: current_user)
	  end

end