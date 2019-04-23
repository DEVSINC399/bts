Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  get 'home/index'
  authenticated :user do
    root 'home#index'
  end
  root 'welcome#index'
end
