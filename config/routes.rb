Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    get :likes, on: :member
  end
  
  resources :supplements do
    get :search, on: :collection
    get :select, on: :collection
  end
  
  resources :favorites, only: [:create, :destroy]
  
  resources :menus, only: [:index, :show, :new, :create] do
    get :select, on: :member
  end
    
  get 'suggestions', to: 'menus#new'
  
end
