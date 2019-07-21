Rails.application.routes.draw do

  resources :anmitsu
  # Home
  root to: "home#top"
  get "/about", to: "home#about"
  get "/authority", to: "home#authority"

  # Bector
  get "/bector/top", to: "bector#top"
  get "/bector/reaction/:id", to: "bector#index"
  get "/bector/custom/:level", to: "bector#index"
  post "/bector/search", to:"bector#search"
  get "/bector/users/:user_id", to:"bector#index"
  get "/bector/tags/:tag", to:"bector#index"
  resources :bector

  # Users
  resources :users, only: [:edit, :update, :destroy, :new]
  get "/users/:user_id", to: "users#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"


  get "/reports/:type/:id", to: "reports#show"
  post "/reports/:type/:id/create", to:"reports#create"

  # Manages
  get '/manages', to: "manages#index"
  get '/manages/debug'

  resources :manage_users
  post "/manage_users/:id", to: "manage_users#update"

  resources :manage_bector
  post "/manage_bector/:id", to: "manage_bector#update"

  resources :manage_informations
  resources :manage_reports
  resources :manage_contests
  post "/manage_contests/:id", to: "manage_contests#update"

  resources :manage_questions

  post "/reactions/:reactioned_type/:reactioned_id/create", to: "reactions#create"
  delete "/reactions/:reactioned_type/:reactioned_id/destroy", to: "reactions#destroy"

  # Informations
  resources :informations

  # Sessions
  get "/login", to: "sessions#new"
  post '/login', to: 'sessions#create'
  get '/auth/twitter/callback', to: 'sessions#create'
  get "/login/:login_type", to: "sessions#new"
  post '/login/:login_type', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete "/logout/:service", to: "sessions#destroy"

  # Crafes! Draft Contest
  resources :draft_contests do
    post "/", to: "draft_contests#approval"
  end

  # Crafes!
  get "/crafes/about", to: "crafes#about"
  resources :crafes
  resources :contests do
    get "/problem_1", to: "contests#problem_1"
    get "/problem_2", to: "contests#problem_2"
    get "/problem_3", to: "contests#problem_3"
    get "/problem_4", to: "contests#problem_4"
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
