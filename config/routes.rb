Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :refueling, except: %i[index show], controller: 'refuelings'
end
