Rails.application.routes.draw do
  root 'list_prices#index'
  resources :list_prices , param: :pklist
end
