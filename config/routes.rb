require 'sidekiq/web'
Rails.application.routes.draw do

  resources :waitlists
 resources :line_items
 resources :carts
 resources :categories

 post 'line_items', to: 'line_items#show'
 get 'checkout', to: 'checkouts#show'

 get 'videos/index2'

 get 'purchases/previous_purchases'
 post 'purchases/show'

 get 'rentals_list/show'
 delete 'rentals_list/destroy', to: 'rentals_list#destroy'

 resources :charges
 resources :purchases, only: [:show]

 post 'videos/rent_form' 

 post 'videos/clear_cart' 
 get 'videos/cart' 

 get 'cart_list/show'

 post 'videos/add_to_cart/:id', to: 'videos#add_to_cart', as: 'add_to_cart' 
 delete 'videos/remove_from_cart/:id', to: 'videos#remove_from_cart', as: 'remove_from_cart' 

 devise_scope :user do
   get '/admin/sign_out' => 'devise/sessions#destroy'
 end


 devise_scope :customer do
   get '/home/sign_out' => 'devise/sessions#destroy'
 end

  resources :actors
  resources :videos do
   collection do
    get :autocomplete
   end
  end
  
  get 'users/edit_profile'
  devise_for :customers, path: 'home'
  devise_for :users, path: 'admin', :skip => [:registrations]

  scope '/admin' do 
    resources :genres
    resources :roles
    resources :users
  end

  scope '/home' do 
    resources :customers
  end

  scope '/customer' do
    get 'rentals_list/show'
    resources :copies
    resources :rent_items
    resources :cart_items
    resources :rentals_list, only: [:show]
  end   

  root to: 'videos#index'

  post 'copies/new', to: 'copies#new'
  get '/users/clear', to: 'users#clear', as: 'clear'


  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
