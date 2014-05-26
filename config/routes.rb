# -*- encoding : utf-8 -*-
Layer::Application.routes.draw do
  resources :events, only: [:index, :show, :create]
  resources :items, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
end
