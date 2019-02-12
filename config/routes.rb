Rails.application.routes.draw do

  get "/crafes" => "crafes#top"
  get "/crafes/about" => "crafes#about"
  get "/crafes/index" => "crafes#index"
  get "/crafes/create" => "crafes#create"






  get "/bector" => "bector#top"
  get "/bector/new" => "bector#new"
  post "/bector/create" => "bector#create"
  get "/bector/:id" => "bector#show"
  get "/users/index" => "users#index"
  get "/" => "home#index"
  get "/about" => "home#about"
  get "/privacypolicy" => "home#privacyPolicy"
end
