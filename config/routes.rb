Rails.application.routes.draw do
  namespace :banbo do
    get '/', to: 'home#top'
  end
end
