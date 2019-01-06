Rails.application.routes.draw do
  get "/" => "home#index"
  get "/home/history" => "home#history"
end
