Rails.application.routes.draw do

  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
  end
  namespace :public do
    root to: "homes#top"
    get 'homes/about'
  end
  namespace :admin do
    get '' => 'homes#top'
  end
  namespace :public do
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :update]
    resources :cart_items, only: [:index, :create, :update]
  end

  namespace :admin do
    resources :genres, only: [:new, :create, :index, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
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
