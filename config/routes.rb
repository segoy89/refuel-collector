# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: %i[password]
  root to: 'refuelings#index'

  resources :refuelings, except: %i[index show], controller: 'refuelings'
end
