ActionController::Routing::Routes.draw do |map|
  map.root :controller => :index, :action => :index
  
  map.resources :users, :collection => {
  	:conference_reps => :get,
  	:national_committee => :get,
  	:search => :post
	}, :member => {
	  :subscribe_to_newsletter => :get,
	  :unsubscribe_from_newsletter => :get
	}
	
	map.resources :password_resets
  
  map.resources :schools, :collection => { :search => :post } do |school|
    school.resources :uploads, :except => :index
  end
  
  map.resources :districts do |district|
    district.resources :uploads, :except => :index
  end
  
  map.resources :conferences do |conference|
    conference.resources :uploads, :except => :index
  end
  
  map.resources :divisions do |division|
    division.resources :uploads, :except => :index
  end
  
  map.resources :jobs, :collection => { :feed => :get }
  
  map.resources :user_sessions
  map.sign_up '/sign_up', :controller => :users, :action => :new
  map.sign_in '/sign_in', :controller => :user_sessions, :action => :new
  map.sign_out '/sign_out', :controller => :user_sessions, :action => :destroy
end
