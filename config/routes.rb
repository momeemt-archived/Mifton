Rails.application.routes.draw do

  # Home
  root to: "home#top"
  get "/about", to: "home#about"

  # Users
  resources :users do
    get "/profile_edit", to: "users#profile_edit"
  end

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
end
