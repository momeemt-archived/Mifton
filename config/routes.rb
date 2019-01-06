Rails.application.routes.draw do
  get "/" => "home#index"
  get "/about" => "home#about"
end
