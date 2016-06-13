Rails.application.routes.draw do
  root 'home#index'
  resources :challenges, only: :show
end
