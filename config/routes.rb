Rails.application.routes.draw do
	# Root
	root "home#home"

	# Users
	resources :users, only: [:create, :update]
	get "users" => "users#index", as: :index_users
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

	# Games
	get "games" => "games#index",
		as: :index_games

	# Game Starts
	resource :starts, only: [:create]
	get "starts/:game_id" => "starts#new",
		as: :new_starts
	get "start/:key_master" => "starts#show",
		as: :show_starts
	delete "start/user_sessions" => "user_sessions#destroy",
		as: :delete_starts_user_sessions		

	# Teams
	resource :teams, only: [:create, :update]
	get "teams/:key_master" => "teams#index",
		as: :index_teams
	get "showteams" => "teams#index",
		as: :show_teams
	delete "teams/team" => "teams#destroy",
		as: :destroy_teams
	delete "teams/user_sessions" => "user_sessions#destroy",
		as: :destroy_teams_user_sessions

	# Phase
	get "phases/:game_id/:key_master" => "phases#index",
		as: :index_phases	
	delete "phases/user_sessions" => "user_sessions#destroy",
		as: :delete_phases_user_sessions

	# PhaseStarts
	resource :phasestarts, only: [:create]
	get "phasestarts/:id/:key_master" => "phasestarts#new",
		as: :new_phasestarts	
	delete "phasestarts/user_sessions" => "user_sessions#destroy",
		as: :delete_phasestarts_user_sessions			
	get "startplayer/:phase_id/:key_master" => "phasestarts#startplayer",
		as: :startplayer_phasestarts
	get "phasestarts" => "phasestarts#show",
		as: :show_phasestarts

	# Plays
	resource :plays, only: [:create]
	get "plays/:key_master/:game_id/:phase_id" => "plays#new",
		as: :new_plays

end
