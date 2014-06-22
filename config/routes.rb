require 'sidekiq/web'

HereDoggie::Application.routes.draw do
  get "static/about"
  get "static/faq"
  get "static/landing"
  resources :searches

  root 'searches#new'

  mount Sidekiq::Web, at: "/sidekiq"

end
