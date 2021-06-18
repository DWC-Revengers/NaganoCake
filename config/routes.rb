Rails.application.routes.draw do
  devise_for :managers, controllers: {
  sessions: 'managers/sessions'
  }
  namespace :admin do
   root 'homes#top'
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :sweets, only: [:index, :new, :create, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :order_sweets, only: [:update]
 end

  devise_for :customers
  namespace :public do
   root 'homes#top'
   get 'homes/about' => 'homes#about', as: 'about'
   resources :customers, only: [:show, :edit, :update] do
     collection do
       get 'hide'
       patch 'withdraw'
     end
   end

   resources :addresses, only: [:index, :create, :destroy, :edit, :update]
   resources :sweets, only: [:index, :show]
   resources :cart_items, only: [:create, :index, :update, :destroy] do
     collection do
       delete 'destroy_all'
    end
   end

   resources :orders, only: [:new, :create, :index, :show] do
     collection do
       post 'check'
       get 'complete'
     end
   end

  end
end
