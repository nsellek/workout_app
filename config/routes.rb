Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/invite/:token', to: 'invites#show'

  resources :accounts, only: [:index, :create, :show]

  namespace :clients do
    get '/dashboard', to: 'dashboards#dashboard'
    get '/workout', to: 'workout_days#index'
    get '/options', to: 'options#index'
    get '/profile', to: 'clients#edit'

    resources :clients, only: [:update]
    resources :trainers, only: [:new, :create]
    resources :histories, only: [:index]

    resources :workout_days, only: [], shallow: true do
      member do
        post :complete
      end
      resources :exercises, only: [] do
        resources :workout_sets, except: :index do
          member do
            post :repeat
          end
        end
      end
    end
  end

  namespace :trainers do
    get '/dashboard', to: 'dashboards#dashboard'
    get '/profile', to: 'trainers#profile'

    resources :configurations, only: [:index, :update]

    resources :clients, only: [:index, :show, :new] do
      resources :workouts, only: [:index, :show, :new, :edit]
      resources :workout_weeks, only: [:create, :update, :show]
    end
  end
end
