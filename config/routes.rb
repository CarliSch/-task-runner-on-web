Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "index_open_tasks", to: "tasks#index_open_tasks"
  get "index_closed_tasks", to: "pages#index_closed_tasks"
  get "task/:id", to: "tasks#task"
  get '/oauth2-callback', to: 'oauth#oauth_callback'
  get '/logout', to: 'oauth#logout'
  get '/login', to: 'oauth#login'
  # get "index", to: "pages#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
