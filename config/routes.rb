Rails.application.routes.draw do
  devise_for :users

  # User submitted content
  resources :smash_reports, only: [:show, :create, :update, :destroy]
  match '/smash_reports/index', to: 'smash_reports#index', via: [:post]
  resources :merge_reports, only: [:show, :create, :update, :destroy]
  match '/merge_reports/index', to: 'merge_reports#index', via: [:post]
  resources :smash_settings, only: [:show, :create, :update, :destroy]
  match '/smash_settings/index', to: 'smash_settings#index', via: [:post]

  # Users and Statistics
  resources :users, only: [:show]
  match '/users/index', to: 'users#index', via: [:post]
  resources :mator_smash_statistics, only: [:show, :update]
  match '/mator_smash_statistics/index', to: 'mator_smash_statistics#index', via: [:post]
  resources :merge_plugins_statistics, only: [:show, :update]
  match '/merge_plugins_statistics/index', to: 'merge_plugins_statistics#index', via: [:post]

  # Server Operation
  resources :blacklist_entries, only: [:show, :create, :destroy]
  match '/blacklist_entries/index', to: 'blacklist_entries#index', via: [:post]
  resources :versions, only: [:index, :create, :destroy]
  
  # welcome page
  resources 'welcome', only: [:index]

  # root of site
  root 'welcome#index'
end
