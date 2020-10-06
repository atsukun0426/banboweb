Rails.application.routes.draw do
  devise_for :performers, controllers: {
    sessions:      'performers/sessions',
    passwords:     'performers/sessions',
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
