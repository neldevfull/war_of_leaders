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

	# Game Starts
	resource :starts, only: [:create]
	get "starts/:id" => "starts#new",
		as: :new_starts
	get "start/:id" => "starts#show",
		as: :show_starts
	delete "starts/user_sessions" => "user_sessions#destroy",
		as: :delete_starts_user_sessions		

	# Teams
	resource :teams, only: [:create, :update]
	get "teams" => "teams#index",
		as: :index_teams
	get "showteams" => "teams#index",
		as: :show_teams	

	get "phases/:id" => "phases#index",
		as: :index_phases		

end
