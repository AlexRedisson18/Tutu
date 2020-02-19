Rails.application.routes.draw do
  devise_for :users

  resources :tickets, only: %i[create show]
  resource :search, only: %i[new show edit]

  root 'welcome#index'

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :trains do
      resources :carriages, shallow: true
    end

    resources :routes
    resources :tickets
  end
end
