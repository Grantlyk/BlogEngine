Rails.application.routes.draw do

	get 'log_out' => 'sessions#destroy', :as => 'log_out'
	get 'admin' => 'sessions#new', :as => 'admin'
	get 'sign_up' => 'users#new', :as => 'sign_up'
	get 'admin_panel' => 'admin#panel', :as => 'admin_panel'

	get 'delete_post' => 'posts#destroy', :as => 'delete_post'

	root :to => 'posts#index'

	resources :users
	resources :sessions
	resources :admin  
	
	resources :posts do
		resources :comments, :only => [:create]
  	end
end
