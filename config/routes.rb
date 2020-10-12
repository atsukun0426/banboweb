Rails.application.routes.draw do
  #get '/', to: 'home#top'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  devise_for :performers, controllers: {
    sessions:      'performers/sessions',
    passwords:     'performers/passwords',
    registrations: 'performers/registrations'
  }
  devise_for :organizers, path: :organizers, controllers: {
    sessions:      'organizers/sessions',
    passwords:     'organizers/passwords',
    registrations: 'organizers/registrations'
  }
  namespace :banbo do
    get '/', to: 'home#top'
  end
end
