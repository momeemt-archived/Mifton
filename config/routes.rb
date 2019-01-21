Rails.application.routes.draw do
  get "/crafes" => "crafes#top"
  get "/crafes/fes-index" => "crafes#index"
  get "/bector" => "bector#top"
  get "/bector/new" => "bector#new"
  post "/bector/create" => "bector#create"
  get "/bector/:id" => "bector#show"
  get "/users/index" => "users#index"
  get "/" => "home#index"
  get "/about" => "home#about"
  get "/privacypolicy" => "home#privacyPolicy"
end
