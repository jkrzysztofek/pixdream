# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pins do
    collection do
      match 'search' => 'pins#search', via: %i[get post], as: :search
    end
  end

  namespace :api do
    namespace :v1 do
      resources :pins
      resources :boards
    end
  end  

  resources :boards
  devise_for :users
  root 'home#index'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
