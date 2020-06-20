Rails.application.routes.draw do
	get '/top' => 'homes#top'

	devise_for :admins, skip: :all
	devise_scope :admin do
		get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
		post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
		delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
		get 'admins/sign_up' => 'admins/registrations#new', as: 'new_admin_registration'
		post 'admins' => 'admins/registrations#create', as: 'admin_registration'
		get 'admins/password/new' => 'admins/passwords#new', as: 'new_admin_password'
	end

	devise_for :customers, skip: :all
	devise_scope :customer do
		get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
		post 'customers/sign_in' => 'customers/sessions#create', as: 'customer_session'
		delete 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
		get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
		post 'customers' => 'customers/registrations#create', as: 'customer_registration'
		get 'customers/password/new' => 'customers/passwords#new', as: 'new_customer_password'
	end

	namespace :admins do
		resource :customers
		resources :deliveries
		resources :items
		resources :orders
		get '/top' => 'homes#top'
	end

	namespace :customers do
		resources :deliveries
		resources :items
	end
    #root 'homes#top'
    resources :orders

end
