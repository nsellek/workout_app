Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/invite/:token', to: 'invites#show'

  resources :accounts, only: [:index, :create, :show]
  resources :workouts, only: [:index]

  namespace :clients do
    get '/dashboard', to: 'dashboards#dashboard'
    get '/workout', to: 'workout_days#index'
    get '/options', to: 'options#index'
    get '/profile', to: 'clients#edit'

    resources :clients, only: [:update]
    resources :trainers, only: [:new, :create, :index, :destroy]
    resources :histories, only: [:index, :show]
    resources :workout_maxes, except: [:destroy]

    resources :workout_days, only: [:show], shallow: true do
      member do
        post :complete
      end
      resources :exercises, only: [:edit, :update] do
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

    resources :workouts, except: [:destroy]

    resources :clients, only: [:index, :show, :new] do
      resources :workouts, only: [:index, :show, :new, :edit, :destroy]
      resources :workout_weeks
    end
  end
end
