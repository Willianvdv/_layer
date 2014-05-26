# -*- encoding : utf-8 -*-
Layer::Application.routes.draw do
  namespace :api do
    resources :events, only: [:index, :show, :create]
    resources :items, only: [:index, :show, :create, :update]
    resources :users, only: [:index, :show, :create, :update]
  end
end
