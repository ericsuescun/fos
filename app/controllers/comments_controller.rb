class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
	  @comment = @commentable.comments.new(comment_params)
	  @comment.user = current_user
	  @commentable.save
	  # byebug
	  if @commentable.kind_of?(Answer)
	  	redirect_to question_path(@commentable.question), notice: "Comentario publicado!"
	  else 
	  	redirect_to @commentable, notice: "Comentario publicado!"
	  end
	end

	private
	  def comment_params
	    params.require(:comment).permit(:body).merge(user: current_user)
	  end
end