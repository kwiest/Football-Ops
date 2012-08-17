FootballOps::Application.routes.draw do
  resources :schools do
    collection do
      get :search
    end
  end

  resources :conferences, :districts, :divisions

  resources :user_sessions, only: %w(create)
  resources :password_resets

  match '/sign_up'               => 'users#new', as: :sign_up
  match '/sign_in'               => 'user_sessions#new', as: :sign_in
  match '/sign_out'              => 'user_sessions#destroy', as: :sign_out
  match '/user_sessions/current' => 'user_sessions#current'

  match '/developer'         => 'developer#index'
  match '/developer/:action' => 'developer#:action'

  match '/directory' => 'directory#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, except: %w(new edit) do
        collection do
          get :search
          get :conference_reps
          get :national_committee
        end
      end
    end
  end
  
  root to: 'index#index'
end
