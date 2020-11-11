Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations' # omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_for :organizers, controllers: {
    sessions: 'organizers/sessions',
    passwords: 'organizers/passwords',
    registrations: 'organizers/registrations'

  }
  resources :users, only: [:index, :show]
  get "show_posts" => "posts#show_posts"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :recruitments do
    resources :requests, only: [:new, :index, :create, :destroy]
  end
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
