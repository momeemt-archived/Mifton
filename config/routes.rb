Rails.application.routes.draw do

  # Home
  root to: "home#top"
  get "/about", to: "home#about"

  # Bector
  get "/bector/top", to: "bector#top"
  resources :bector

  # Users
  resources :users do
    get "/profile_edit", to: "users#profile_edit"
  end

  # Manages
  get '/manages', to: "manages#index"
  get '/manages/debug'

  resources :manage_users
  post "/manage_users/:id", to: "manage_users#update"

  resources :manage_bector
  post "/manage_bector/:id", to: "manage_bector#update"

  resources :manage_informations

  post "/reactions/:reactioned_id/create", to: "reactions#create"
  delete "/reactions/:reactioned_id/destroy", to: "reactions#destroy"

  # Informations
  resources :informations

  # Sessions
  get "/login", to: "sessions#new"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Crafes! Draft Contest
  resources :draft_contests do
    post "/", to: "draft_contests#approval"
  end

  # Crafes!
  get "/crafes", to: "contests#home"
  get "/crafes/about", to: "contests#about"
  get "/crafes/admin", to: "contests#admin"
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
end
