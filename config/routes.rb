require 'sidekiq/web'

HereDoggie::Application.routes.draw do

  # Static pages and Landing Page
  get "static/about"
  get "static/faq"
  get "static/landing"

  # Dog Searches
  resources :searches

  # Users and Sessions
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "login", to: "sessions#create"
  get "exit", to: "sessions#destroy", as: 'logout'

  root "static#landing"

  mount Sidekiq::Web, at: "/sidekiq"

end
