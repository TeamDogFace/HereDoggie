require 'sidekiq/web'

HereDoggie::Application.routes.draw do
  resources :searches

  root 'searches#new'

  mount Sidekiq::Web, at: "/sidekiq"

end
