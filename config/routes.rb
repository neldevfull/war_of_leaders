Rails.application.routes.draw do
	# Root
	root "home#home"

	# Users
	resources :users, only: [:create, :update]
	# get "users" => "users#index", as: :index_users
	get "users"  => "users#new", 
		as: :new_user
	get "user/:id/edit" => "users#edit", 
		as: :edit_user

	# UserSession
	resource :user_sessions, only: [:create, :destroy]
	post "login" => "user_sessions#new",
		as: :new_user_sessions
	get  "login" => "user_sessions#new",
		as: :get_user_sessions

	# Player
	get "players" => "players#index",
		as: :index_players

	# Master
	get "masters" => "masters#index",
		as: :index_masters

	# Games
	get "games" => "games#index",
		as: :index_games

	# Teams
	resource :teams, only: [:create, :update]
	get "teams" => "teams#index",
		as: :index_teams	

end
