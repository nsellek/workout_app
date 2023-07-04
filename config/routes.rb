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
    get '/workout', to: 'workout_days#index'

    resources :workout_days, only: [], shallow: true do
      resources :exercises, only: [] do
        resources :workout_sets, only: [:new, :create, :edit, :update]
      end
    end
  end

  namespace :trainers do
    get '/dashboard', to: 'dashboards#dashboard'
    get '/profile', to: 'trainers#profile'
    resources :clients, only: [:index, :show, :new] do
      resources :workouts, only: [:index, :show, :new, :edit]
      resources :workout_weeks, only: [:create, :update, :show]
    end
  end
end
