Rails.application.routes.draw do
  devise_for :users

  # User submitted content
  resources :smash_reports
  match '/smash_reports/index', to: 'smash_reports#index', via: [:post]

  resources :merge_reports
  match '/merge_reports/index', to: 'merge_reports#index', via: [:post]

  match '/smash_settings/index', to: 'smash_settings#index', via: [:post]
  resources :smash_settings

  # Users and Statistics
  resources :users
  match '/users/index', to: 'users#index', via: [:post]

  resources :mator_smash_statistics
  match '/mator_smash_statistics/index', to: 'mator_smash_statistics#index', via: [:post]

  resources :merge_plugins_statistics
  match '/merge_plugins_statistics/index', to: 'merge_plugins_statistics#index', via: [:post]

  # Blacklist Entries
  resources :blacklist_entries
  match '/blacklist_entries/index', to: 'blacklist_entries#index', via: [:post]
  
  # welcome page
  resources 'welcome', only: [:index]
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
