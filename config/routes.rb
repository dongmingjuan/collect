require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, :path => "admin_users"
  # sidekiq网页客服端
  mount Sidekiq::Web => '/admin/sidekiq'
  resources :photos, only: [:index, :edit, :update, :destroy]
  resources :articles do
    resources :pictures#, shallow: true
    collection do
      get :ascending
      get :descending
    end
  end
  resources :labels do
    member do
      put :active
      put :unactive
    end
    collection do
      put :allactive
      get :ascending
      get :descending
    end
  end
  root to: "articles#index"

  # namespace :admin do
  # 	resources :users
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
