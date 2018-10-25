Rails.application.routes.draw do

  resources :tours, only: [:index, :show]
  resources :users
  resources :reviews
  resources :countries, only: [:index, :show]
  resources :cities, only: [:index, :show]

  get    '/login',   to: 'sessions#new', as: "login"
  post   '/login',   to: 'sessions#create', as: "sessions"
  delete '/logout',  to: 'sessions#destroy'
  get '/', to: 'sessions#welcome', as: 'welcome'
  get '/analytic', to: 'countries#analytic', as: 'analytic'
  get '/search', to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
