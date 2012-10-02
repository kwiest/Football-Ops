FootballOps::Application.routes.draw do
  match '/sign_up'               => 'users#new', as: :sign_up
  match '/sign_in'               => 'user_sessions#new', as: :sign_in
  match '/sign_out'              => 'user_sessions#destroy', as: :sign_out
  match '/user_sessions/current' => 'user_sessions#current'

  resources :user_sessions, only: %w(create)
  resources :password_resets

  match '/directory' => 'directory#index'

  # OAuth2
  # Authorization of app
  get  '/oauth/authorize' => 'oauth#authorize'
  post '/oauth/authorize' => 'oauth#create_authorization_code'

  # Developer Docs
  namespace :developer do
    resources :apps
    match '/'        => 'developer#index'
    match '/:action' => 'developer#:action'
  end

  # JSON API Routes
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, except: %w(new edit) do
        collection do
          get :search
          get :conference_reps
          get :national_committee
          get :total_count
        end
      end

      resources :schools, only: %w(index show) do
        get :search, on: :collection
      end

      resources :conferences, :districts, :divisions
    end
  end
  
  root to: 'index#index'
end
