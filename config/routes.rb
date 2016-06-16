Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :challenges, only: [:show] do
    post 'start', on: :member
    post 'complete', on: :member
  end

  resources :solutions, only: [:show]
end
