Rails.application.routes.draw do
  devise_for :users
  root 'product#index'
  resources :products
  resources :sales
  get 'monthly', controller: 'index', action: 'monthly_report'
  get 'total', controller: 'index', action: 'product_cost_report'
  post 'generatemr', controller: 'index', action: 'generate_monthly_report'
end
