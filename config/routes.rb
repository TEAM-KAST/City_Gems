Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'pins#index'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'about', to: 'pins#about', as: 'about'
  post 'pintags', to: 'pintags#create', as: 'pintags'

  resources :sessions, only: [:create, :destroy]
  resources :tags, only: [:index, :show]
  resources :pintags, only: [:new, :create]
  resources :pins do
    resources :comments, except: :index
  end
  resource :users, only: :show

  root 'pins#index'

end
