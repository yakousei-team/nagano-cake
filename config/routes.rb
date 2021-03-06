Rails.application.routes.draw do

  root 'homes#top'

	devise_for :admins, skip: :all
	devise_for :customers, skip: :all
	devise_scope :admin do
		get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
		post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
		delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
		get 'admins/sign_up' => 'admins/registrations#new', as: 'new_admin_registration'
		post 'admins' => 'admins/registrations#create', as: 'admin_registration'
		get 'admins/password/new' => 'admins/passwords#new', as: 'new_admin_password'
	end

	
	devise_scope :customer do
		get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
		post 'customers/sign_in' => 'customers/sessions#create', as: 'customer_session'
		delete 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
		get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
		post 'customers' => 'customers/registrations#create', as: 'customer_registration'
		get 'customers/password/new' => 'customers/passwords#new', as: 'new_customer_password'
	end

	namespace :admins do
		resources :customers
		resources :deliveries
		resources :items
		resources :genres
		resources :orders

		get '/top' => 'homes#top'
    get '/customer/:id/orders' => 'orders#customer_index', as:'customer_orders'
	end

	namespace :customers do
		resources :deliveries
	end

	scope module: 'customers' do
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
  end
    #root 'homes#top'

    resource :customers
    post 'customers/edit' => 'customers#edit'
    get 'customers/confirm' => 'customers#confirm'
    post 'customers/confirm' => 'customers#confirm'
    get 'customers/change' => 'customers#change'
    post 'customers/change' => 'customers#change'
    put 'customers/hide' => 'customers#hide', as:'customers_hide'
    resources :orders
    post '/orders/infomation' => 'orders#infomation'
    get 'thanks' => 'orders#thanks'
    patch 'production_status_update/:id' => 'admins/orders#production_status_update', as:'production_status_update'


end
