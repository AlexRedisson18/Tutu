Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :routes
  root 'welcome#index'
end
