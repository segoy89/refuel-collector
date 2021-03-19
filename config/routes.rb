# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: %i[password]
  root to: 'refuelings#index'

  resources :refuelings, except: %i[index show], controller: 'refuelings'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: '', controllers: { sessions: 'api/v1/sessions' }
      resources :refuelings
    end
  end
end
