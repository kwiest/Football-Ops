FootballOps::Application.routes.draw do
  resources :users, only: %w(new create)
  get '/sign_up' => 'users#new', as: :sign_up

  get    '/sign_in'               => 'user_sessions#new',     as: :sign_in
  delete '/sign_out'              => 'user_sessions#destroy', as: :sign_out
  get    '/user_sessions/current' => 'user_sessions#current', as: :current_user
  post   '/user_sessions'         => 'user_sessions#create'

  resources :password_resets, except: %w(index show delete)

  match '/directory' => 'directory#index'

  # OAuth2
  # Authorization of app
  get  '/oauth/authorize' => 'oauth#authorize'
  post '/oauth/authorize' => 'oauth#create_authorization_code'
  # Request access_token
  post '/oauth/token'     => 'oauth#create_access_token'

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

          match 'email_addresses'                              => 'users#email_addresses',               via: :get
          match 'email_addresses_by_conference/:conference_id' => 'users#email_addresses_by_conference', via: :get
          match 'email_addresses_by_district/:district_id'     => 'users#email_addresses_by_district',   via: :get
          match 'email_addresses_by_division/:division_id'     => 'users#email_addresses_by_division',   via: :get
          match 'email_addresses_by_school/:school_id'         => 'users#email_addresses_by_school',     via: :get
        end
      end

      resources :schools, only: %w(index show) do
        get :paginated, on: :collection
        get :search,    on: :collection
      end
      match 'schools/paginated/total_count' => 'schools#total_count', via: :get

      resources :conferences, :districts, :divisions
    end
  end
  
  root to: 'index#index'
end
