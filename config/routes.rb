Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/invite/:token', to: 'invites#show'

  namespace :clients do
    get '/dashboard', to: 'dashboards#dashboard'
  end

  namespace :trainers do
    get '/dashboard', to: 'dashboards#dashboard'
    resources :clients, only: [:index, :new], shallow: true
  end
end
