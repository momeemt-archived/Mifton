Rails.application.routes.draw do

  get "/crafes" => "crafes#top" # Crafes! トップページ
  get "/crafes/about" => "crafes#about" # Crafes! 詳細ページ
  get "/crafes/index" => "crafes#index" #Crafes! コンテスト一覧ページ
  get "/crafes/new" => "crafes#new" #Crafes! 管理者用コンテスト作成ページ
  post "/crafes/create" => "crafes#create" #Crafes! コンテスト送信ページ
  get "/crafes/contest_request" => "crafes#contest_request" # Crafes! コンテストリクエストページ
  post "/crafes/submit" => "crafes#contest_submit" #Crafes! コンテストリクエスト送信ページ
  get "/crafes/:id" => "crafes#show" # Crafes! コンテスト詳細ページ
  get "/crafes/:id/1" => "crafes#question1" # コンテスト問題1問目
  get "/crafes/:id/2" => "crafes#question2" # コンテスト問題2問目
  get "/crafes/:id/3" => "crafes#question3" # コンテスト問題3問目
  get "/crafes/:id/4" => "crafes#question4" # コンテスト問題4問目
  get "/crafes/:id/submit" => "crafes#submit" # コンテスト問題提出ページ
  post "/crafes/:id/que_submit" => "crafes#question_submit" # コンテスト問題回答送信
  get "/crafes/:id/rank_table" => "crafes#rank_table" # コンテスト順位表
  post "/crafes/:id/destroy" => "crafes#destroy" #コンテスト削除
  get "/crafes/:id/edit" => "crafes#edit" # コンテスト編集
  post "/crafes/:id/update" => "crafes#update" #コンテスト情報更新

  get "/users/index" => "users#index" # ユーザー一覧
  get "/signup" => "users#new" # 新規登録
  get "/users/:id" => "users#show" # ユーザー詳細ページ
  



  get "/bector" => "bector#top"
  get "/bector/new" => "bector#new"
  post "/bector/create" => "bector#create"
  get "/bector/:id" => "bector#show"
  
  get "/" => "home#index"
  get "/about" => "home#about"
  get "/privacypolicy" => "home#privacyPolicy"
end
