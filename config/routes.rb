Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"
  get 'orders/log'
  get 'orders/complete'
  get 'cart_items/all_destroy'
  get 'customers/quit'
  get 'customers/out'

   resources :customers, expect: [:new, :create, :destroy, :index] do
      resources :orders, expect: [:destroy, :update, :edit] do
        resources :order_details, only: [:new]
   end
      resources :cart_items, expect: [:new, :show, :edit]
      resources :shipping_addresses, expect: [:new, :show]
   end
    resources :order_details, only: [:new]
    resources :items, only: [:index, :show]
    resources :customers, expect: [:new, :create, :destroy, :index]

  namespace :admin do
    get 'admin/order_details/update'
  end
  namespace :admin do
    get 'admin/orders/index'
    get 'admin/orders/show'
    get 'admin/orders/update'
  end
  namespace :admin do
    get 'admin/genres/index'
    get 'admin/genres/create'
    get 'admin/genres/edit'
    get 'admin/genres/update'
  end
  namespace :admin do
    get 'admin/items/new'
    get 'admin/items/index'
    get 'admin/items/show'
    get 'admin/items/create'
    get 'admin/items/edit'
    get 'admin/items/update'
  end
  namespace :admin do
    get 'admin/homes/top'
  end
  namespace :admin do
    get 'admin/customers/index'
    get 'admin/customers/show'
    get 'admin/customers/edit'
    get 'admin/customers/update'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
