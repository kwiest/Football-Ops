FootballOps::Application.routes.draw do
  resources :users do
    collection do
      get :conference_reps
      get :national_committee
      post :search
    end
  end
  resources :password_resets

  resources :schools do
    collection do
        post :search
    end
    resources :uploads, :except => :index
  end

  resources :districts do
    resources :uploads, :except => :index
  end

  resources :conferences do
    resources :uploads, :except => :index
  end

  resources :divisions do
    resources :uploads, :except => :index
  end
  
  resources :jobs do
    collection do
      get :feed
    end
  end

  resources :user_sessions
  match '/sign_up' => 'users#new', :as => :sign_up
  match '/sign_in' => 'user_sessions#new', :as => :sign_in
  match '/sign_out' => 'user_sessions#destroy', :as => :sign_out
  
  root :to => 'index#index'
end