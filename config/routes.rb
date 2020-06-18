Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  resource :customer
  resources :deliveries
  resources :items

  scope module: 'customers' do
    delete 'cart_items/destroy_all', to: 'cart_item#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
