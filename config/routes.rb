Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'pins#index'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'explore', to: 'pins#explore', as: 'explore'
  post 'explore', to: 'pins#filter'

  post 'pin_tags', to: 'pin_tags#create', as: 'pin_tags'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :tags, only: [:index, :show]
  resources :pin_tags, only: [:new, :create]
  resources :pins do
    resources :comments, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  root 'pins#index'
end
