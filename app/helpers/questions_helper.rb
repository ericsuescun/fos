module QuestionsHelper

	def form_title
	  @question.new_record? ? "Publicar Pregunta" : "Modificar Pregunta"
	end
	
end