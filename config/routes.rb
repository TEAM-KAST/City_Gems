Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'pins#index'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'explore', to: 'pins#explore', as: 'explore'
  post 'explore', to: 'pins#filter'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :tags, only: [:index, :show]
  resources :pins do
    resources :comments, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  root 'pins#index'
end
