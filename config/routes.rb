Rails.application.routes.draw do
	# Root
	root "home#home"

	# Users
	resources :users, only: [:create, :update]
	get "users" => "users#index", as: :index_users
	get "user"  => "users#new", as: :new_user
	get "user/:id/edit" => "users#edit", as: :edit_user

	# UserSession
	resource :user_sessions, only: [:create, :destroy]
	get "login" => "user_sessions#new", as: :new_user_sessions

end
