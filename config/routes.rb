Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :challenges, only: [:show] do
    post 'start', on: :member
  end
end
