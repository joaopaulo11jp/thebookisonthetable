Rails.application.routes.draw do
  resources :exchanges
  root 'app#index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'categories/:category' => 'app#index'
  get 'exchanges/new/:book_id' => 'exchanges#new'

  resources :users
  resources :book_tables

  namespace :dashboard do
      resources :users, only: [:index,:show,:edit,:update]
  end


  get 'dashboard' => 'users#show'
  get 'dashboard/user/edit' => 'users#edit'
  get 'dashboard/preferences' => 'dashboard#preferences'
  patch 'dashboard/preferences' => 'dashboard#update_user_preferences'
  get 'dashboard/book' => 'book_tables#index'
  get 'dashboard/book/new'=> 'book_tables#new'
  get 'dashboard/book/:id' => 'book_tables#show', as: :dashboard_book_show
  get 'dashboard/book/:id/edit'=> 'book_tables#edit', as: :dashboard_book_edit
  post 'dashboard/book'=> 'book_tables#create'
  patch 'dashboard/book/:id'=> 'book_tables#update'
  put 'dashboard/book/:id'=> 'book_tables#update'
  delete 'dashboard/book/:id'=> 'book_tables#destroy', as: :dashboard_book_delete

  get 'dashboard/exchanges_sent' => 'dashboard#exchange_sent'
  get 'dashboard/exchanges_received' => 'dashboard#exchange_received'
  patch 'dashboard/exchanges_received/:id/response' => 'dashboard#exchange_accept', as: :dashboard_exchange_accept
  patch 'dashboard/exchanges_received/:id/response' => 'dashboard#exchange_reject', as: :dashboard_exchange_reject

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
