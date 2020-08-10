Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    get :likes, on: :member
    get :menus, on: :member
  end
  
  resources :supplements do
    get :search, on: :collection
  end
  
  resources :favorites, only: [:create, :destroy]
  
  resources :menus, only: [:index, :show, :new, :create, :edit, :update]

  get 'suggestions', to: 'menus#new'
  
end
