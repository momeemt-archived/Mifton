Rails.application.routes.draw do
  get "/bector" => "bector#top"
  get "/" => "home#index"
  get "/about" => "home#about"
  get "/privacypolicy" => "home#privacyPolicy"
end
