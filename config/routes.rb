Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => "admin_users"
  resources :articles
  resources :labels do
    member do
      put :active
      put :unactive
    end
    collection do
      put :allactive
    end
  end
  resources :pictures
  root to: "users#index"

  # namespace :admin do
  # 	resources :users
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
