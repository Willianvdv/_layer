# -*- encoding : utf-8 -*-
Layer::Application.routes.draw do
  resources :events, except: [:new, :edit]
  resources :items, except: [:new, :edit]
  resources :users, except: [:new, :edit]
end
