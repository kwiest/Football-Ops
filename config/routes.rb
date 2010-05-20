ActionController::Routing::Routes.draw do |map|
  map.root :controller => :index, :action => :index
  
  map.resources :users, :collection => {
  	:conference_reps => :get,
  	:national_committee => :get,
  	:search => :post
	}
  
  map.resources :schools, :collection => { :search => :post }
  
  map.resources :districts, :conferences, :divisions
  
  map.resources :user_sessions
  map.sign_up '/sign_up', :controller => :users, :action => :new
  map.sign_in '/sign_in', :controller => :user_sessions, :action => :new
  map.sign_out '/sign_out', :controller => :user_sessions, :action => :destroy
end
