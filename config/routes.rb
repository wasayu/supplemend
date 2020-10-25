Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    get :likes, on: :member
    get :menus, on: :member
    get :calendars, on: :member
  end
  
  resources :supplements, only: [:show] do
    get :search, on: :collection
  end
  
  resources :favorites, only: [:create, :destroy]
  
  resources :menus, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get 'suggestions', to: 'menus#new'
  
  resources :calendars, only: [:show, :new, :create, :destroy]
  
end
