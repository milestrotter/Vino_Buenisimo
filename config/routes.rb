Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :cellars
  resources :wines
  resources :friends
  resources :messages
  resources :trends

  get '/home' => 'users#index'

  get '/users/:id/cellars' => 'cellars#index'

  get '/users/:id/cellar/new' => 'cellars#new'

  post '/cellars/create' => 'cellars#create'

  get '/cellars/:id/wines' => 'wines#new'

  delete '/cellars/:cellar_id/edit/wines/:id', to: 'wines#destroy', as: 'destroy_wines'

  post '/friends/:id', to: 'friends#create', as: 'create_friendship'

  delete '/friends/:id', to: 'friends#destroy', as: 'destroy_friendship'

  get '/users/:id/conversations/new', to: 'conversations#create'

  get '/messages/new/:profile_id', to: 'messages#new', as: 'new_conversation_message'

  get '/trends/show'

  root to: 'users#index'


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
