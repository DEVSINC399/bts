Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  get 'home/index'
  authenticated :user do
    root 'home#index'
  end
  resources :users
  resources :projects do
    resources :bugs
  end
  get '/bugs/:id/assign', to: 'bugs#assign', as: 'bug_assign'
  get '/bugs/:id/resolve', to: 'bugs#resolve', as: 'bug_resolve'
  get '/bugs/:id/review', to: 'bugs#review', as: 'bug_review'
  root 'welcome#index'
end
