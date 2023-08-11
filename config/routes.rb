# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"
  unauthenticated :user do
    root 'splash#index', as: :unauthenticated_root
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  devise_for :users
  resources :users
  resources :categories, only: [:index, :new, :create] do
    resources :products, only: [:index, :new, :create]
  end
end
