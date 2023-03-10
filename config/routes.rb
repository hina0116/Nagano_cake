Rails.application.routes.draw do

  namespace :public do
    get 'homes/' => 'homes#top'
    get 'homes/about'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:new, :create, :index, :edit, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get '/customers/unsubscribe'
    patch '/customers/withdraw'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    post 'orders/confirm'
    get '/orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
  end

  namespace :admin do
    get '' => 'homes#top'
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
  end

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
