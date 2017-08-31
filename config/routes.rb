Rails.application.routes.draw do
  root to: "forums#index"
  devise_for :users
  resources :forums
end
