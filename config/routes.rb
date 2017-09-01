Rails.application.routes.draw do
  root to: "forums#index"
  devise_for :users

  resources :forums do
    member do
      put "like",    to: "forums#upvote"
      put "dislike", to: "forums#downvote"
    end
    resources :comments
  end
end
