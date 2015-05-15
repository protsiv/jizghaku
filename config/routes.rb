Rails.application.routes.draw do

  namespace :admin do
    resources :reviews
  end

  namespace :admin do
    resources :mail_lists
  end

  get 'get_total_price' => 'main#get_total_price'

  mount Ckeditor::Engine => '/ckeditor'

  # devise_for :admins
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks',  registrations: "user/registrations" }
  namespace :admin do
    root to: "admin#index"

    resources :banners
    resources :products
    resources :restaurants
    # resources :reastaurant_images
    resources :categories

    resources :carts
    resources :line_items
  end

  # match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'
  post '/mcsubscribe/subscribe' => 'mcsubscribe#subscribe'
  post '/order_product' => 'main#order_product'
  post '/call_order' => 'main#call_order'

  get '/admin/purchase_history' => 'admin/admin#purchase_history', as: 'purchase_history'
  get '/test' => 'main#test_page'
  get '/term-of-used' => 'main#terms_of_use'
  get '/:url' => 'main#about', as: 'restaurant_about'
  get '/:restaurant/menu' => 'main#catalog', as: 'restaurant_all_menu'
  get '/:restaurant/:catalog' => 'main#catalog', as: 'restaurant_catalog'



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
