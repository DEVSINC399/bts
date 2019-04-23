Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  get 'home/index'
  authenticated :user do
    root 'home#index'
  end
  resources :users
  resources :projects
  resources :bugs
  root 'welcome#index'
end
