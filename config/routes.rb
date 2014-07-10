Rails.application.routes.draw do
  resources :tags

  resources :comments

  resources :articles

end
