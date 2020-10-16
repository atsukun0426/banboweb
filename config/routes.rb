Rails.application.routes.draw do
  root to: 'home#top'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'#omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:show]
  resources :posts, only: [:index, :new, :show, :create, :destroy]
end
