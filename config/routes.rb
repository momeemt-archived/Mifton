Rails.application.routes.draw do
  resources :anmitsu
  # Home
  root to: "home#top"
  get "/about", to: "home#about"
  get "/authority", to: "home#authority"
  get "/help", to: "home#help"
  get "/policy", to: "home#policy"
  get "/terms", to: "home#terms" # 利用規約

  # Bector
  get "/bector/top", to: "bector#top"
  get "/bector/custom/:level", to: "bector#custom"

  get "/bector/global", to: "bector#global"
  get "/bector/friends", to: "bector#friends"
  get "/bector/reactions/:id", to: "bector#reactions"

  post "/bector/search", to:"bector#search"
  get "/bector/users/:user_id", to:"bector#index"
  get "/bector/tags/:tag", to:"bector#tags"
  post "/bector/destroy", to:"bector#destroy"
  resources :bector, only: [:create, :destroy, :index]
  get "/bector/microposts/:id", to: "bector#show"
  post "/bector/microposts/:id", to: "bector#comment"

  # Users
  get "/users/edit", to: "users#edit"
  resources :users, only:  [:update, :destroy]
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"


  post "/reports/", to: "reports#show"
  post "/reports/create", to:"reports#create"

  # Manages
  get '/manages', to: "manages#index"
  get '/manages/debug'
  post "/manages/fix"

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
  get "/crafes", to: "crafes#index"
  get "/crafes/about"
  get "/crafes/schedule"
  get "/crafes/finished"
  get "/crafes/contest/:id", to: "crafes#show_contest"
  get "/crafes/questions"
  get "/crafes/question/:id", to: "crafes#show_question"



  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  resources :account_activations, only: [:edit]
  
  get "/:id", to: "users#show"
end
