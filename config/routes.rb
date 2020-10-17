Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'#omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show]
  resources :posts do
    resources :applies, only: [:create, :destroy]
  end
end
