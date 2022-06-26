Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  root to: "homes#top"
  get 'mypage' => "customers#show"
  get "home/about" => "homes#about"
  post 'orders/log'
  get 'orders/complete'
  get 'cart_items/all_destroy'
  get 'customers/quit'
  get 'customers/out'
  delete '/cart_items/all_destroy' => 'cart_items#all_destroy'

   resources :customers, only: [:update, :edit, :out, :quit] do
      resources :orders, expect: [:destroy, :update, :edit] do
        resources :order_details, only: [:new]
   end
      resources :shipping_addresses, expect: [:show]
   end
    resources :cart_items, expect: [:new, :show, :edit]
    resources :order_details, only: [:new]
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'items#top'
  	resources :genres,only: [:index,:create,:edit,:update,:show]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
        get :current_index
        resource :order_details,only: [:update]
      end
      collection do
        get :today_order_index
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
