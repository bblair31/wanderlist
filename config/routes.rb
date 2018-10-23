Rails.application.routes.draw do

  resources :tours, only: [:index, :show]
  resources :users
  resources :reviews
  resources :countries, only: [:index, :show]
  resources :cities, only: [:index, :show]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/', to: 'sessions#welcome', as: 'welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
