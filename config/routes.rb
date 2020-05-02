Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	root 'admin/home#top'
  	resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :order_items, only: [:update]
    
	end

  get  'items' => 'customer/items#index', as: "customer_items"
  get  'items/:id' => 'customer/items#show', as: "customer_item"
  get 'cart_items' => 'customer/cart_items#index'
  post 'cart_items' => 'customer/cart_items#create'
  patch 'cart_items/:id' => 'customer/cart_items#update'
  delete 'cart_items/:id' => 'customer/cart_items#destroy'
  delete 'cart_items' => 'customer/cart_items#destroy_all'

	scope '/' do
	 		root 'customer/home#top'
	end

end
