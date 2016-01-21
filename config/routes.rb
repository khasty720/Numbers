Rails.application.routes.draw do

  root 'welcome#index'

  #Dogs Routes not using resources
  get 'dogs', to: 'dogs#index', as: 'dogs' #index dogs
  get 'dogs/new', to: 'dogs#new', as: 'new_dog' #new
  get 'dogs/:id', to: 'dogs#show', as: 'dog' #show
  get 'dogs/:id/edit', to: 'dogs#edit', as: 'edit_dog' #edit
  post 'dogs', to: 'dogs#create' #create
  patch 'dogs/:id', to: 'dogs#update' #update
  delete 'dogs/:id', to: 'dogs#destroy', as: 'destroy_dog' #destroy
  #-----------------------

  #get 'users/login', to: 'users#login', as: 'users_login'
  #post 'users/login', to: 'users#authorize', as: 'authorize_user'
  match '/users/login',      to: 'users#login',           via: 'get'
  match '/users/login',      to: 'users#authorize',        via: 'post'

  #Custom Create Method Form
  get '/users/test', to: 'users#test', as: 'user_test' #New
  post '/users/build', to: 'users#build', as: 'build_user' #Create

  #Update Route
  patch '/users/build/:id', to: 'users#change', as: 'change_user' #update

  resources :users do

    #Edit route
    get 'define', on: :member #Edit

    #Same as: post '/users/build', to: 'users#build', as: 'build_user'
    #collection do
    #  get :test
    #end
  end



  resources :numbers
  get 'home/index', as: 'home'
  get 'home/results'

  put 'home/index', to: 'home#comapre', as: 'compare_number'

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
