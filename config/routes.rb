Rails.application.routes.draw do
  # get 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :admin


  get 'orders' => 'orders#index'
  get 'pay' => 'orders#pay'
  post 'pay' => 'orders#purchased'
  patch 'order/:id' => 'orders#update'

  post 'items/order/:id' => 'items#order'

  root :to => "welcome#index"
end
