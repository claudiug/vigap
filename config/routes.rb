Rails.application.routes.draw do
  resources :users

  resources :tags

  resources :comments

  resources :articles

end
