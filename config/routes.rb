Rails.application.routes.draw do
  devise_for :users
  root 'index#home'
  resources :products
end
