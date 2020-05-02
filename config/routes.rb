Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	root 'admin/home#top'
  	resources :items, only:[:new, :create, :index, :show, :edit, :update]
  	resources :customers, only:[:index, :show, :edit, :update]
	end


	scope '/' do
	 		root 'customer/home#top'
	end

end
