Rails.application.routes.draw do
  root "homepage#index"

  get 'order_items/index'
  
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'
  
  get 'homepage/index'

  get 'homepage/cart'

  get 'homepage/history'
  
  get 'homepage/login'
 
  get 'homepage/guide'
 
  get 'homepage/category'

  get 'homepage/search_result'

  get 'homepage/checkout'

  get 'genres/index'

  get 'genres/show'

  get 'genres/new'

  get 'genres/edit'

  get 'genres/create'

  get 'genres/update'

  get 'genres/destroy'

  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/edit'

  get 'products/create'

  get 'products/update'

  get 'products/destroy'

  get 'ratings/new'

  get 'sessions/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :ratings, :products, :genres, :accounts, :homepage
  resources :order_items
  resources :account_activations, only: [:edit]
  
  resources :accounts do
    resources :order_items
  end

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
