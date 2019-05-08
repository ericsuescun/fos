Rails.application.routes.draw do

	devise_for :users
	root 'questions#index'

	resources :questions do
		resource :vote, only: [:create, :destroy]
		resources :answers
		resources :comments, module: :questions	#This is to route to the specific controller for questions
	end

	resources :answers do
		resources :comments, module: :answers	#This is to route to the specific controller for answers
		resource :vote, only: [:create, :destroy]
	end

	resources :users, only: [:new, :create]

	resources :searches, only: [:index]

end