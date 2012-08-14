FootballOps::Application.routes.draw do
  resources :users do
    collection do
      get :conference_reps
      get :national_committee
      get :search
    end
  end
  resources :password_resets

  resources :schools do
    collection do
        post :search
    end
  end

  resources :conferences, :districts, :divisions

  resources :user_sessions
  match '/sign_up' => 'users#new', as: :sign_up
  match '/sign_in' => 'user_sessions#new', as: :sign_in
  match '/sign_out' => 'user_sessions#destroy', as: :sign_out

  match '/developer/:action' => 'developer#:action'
  
  root to: 'index#index'
end
