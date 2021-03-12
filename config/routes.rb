Rails.application.routes.draw do
  devise_for :users, skip: %i[password]
  root to: 'home#index'

  resources :refueling, except: %i[index show], controller: 'refuelings'
end
