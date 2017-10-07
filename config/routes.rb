Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => "admin_users"
  resources :articles
  resources :pictures
  root to: "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
