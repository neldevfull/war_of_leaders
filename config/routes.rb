Rails.application.routes.draw do

root "users#new"
resource :users, only: [:new, :create, :edit, :update]

end
