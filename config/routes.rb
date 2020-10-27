Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations', # omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show]
  get "show_posts" => "posts#show_posts"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
