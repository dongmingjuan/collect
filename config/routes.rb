require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  resources :comments
  resources :cities
  resources :stores
  resources :merchants
  resources :dishes
  resources :tasks
  resources :task_logs
  resources :wx_publics
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, :path => "admin_users"
  # sidekiq网页客服端
  mount Sidekiq::Web => '/admin/sidekiq'
  resources :pictures do
    member do
      delete 'del'
    end
  end
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

  namespace :api, format: 'json' do
    namespace :v1 do
      namespace :admin do
        resources :comments
        resources :cities
        resources :stores
        resources :merchants
        resources :dishes
        resources :tasks
        resources :task_logs
        resources :wx_publics
        resources :users, :path => "admin_users"
        # sidekiq网页客服端
        mount Sidekiq::Web => '/admin/sidekiq'
        resources :pictures do
          member do
            delete 'del'
          end
        end
        resources :articles do
          resources :pictures
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
      end
    end
  end

  # namespace :admin do
  # 	resources :users
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
