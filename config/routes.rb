require 'sidekiq/web'

HereDoggie::Application.routes.draw do

  # Static pages and Landing Page
  get "about", to: "static/about"
  get "faq", to: "static/faq"
  get "landing", to: "static/landing"

  # Dog Searches
  resources :searches

  # Users and Sessions
  resources :users
  get "register", to: "users#new"
  resources :sessions, only: [:new, :create, :destroy]
  get "login", to: "sessions#new"
  get "exit", to: "sessions#destroy", as: "logout"

  root "static#landing"

  mount Sidekiq::Web, at: "/sidekiq"

end
