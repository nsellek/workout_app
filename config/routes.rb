Rails.application.routes.draw do
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
    resources :clients, only: [:index, :show, :new] do
      resources :workouts, only: [:index, :show, :new, :edit]
      resources :workout_weeks, only: [:create, :update, :show]
    end
  end
end
