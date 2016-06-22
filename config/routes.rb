Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  concern :commentable do
    resources :comments, only: [:create]
  end

  resources :challenges,  only: [:show, :new, :create] do
    post 'start',         on: :member
    post 'complete',      on: :member
    concerns :commentable
  end

  resources :solutions, only: [:show], concerns: :commentable
end
