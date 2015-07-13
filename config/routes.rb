Rails.application.routes.draw do

  namespace :users do
  get 'omniauth_callbacks/facebook'
  end
  namespace :users do
  get 'omniauth_callbacks/vkontakte'
  end


  get '/get_total_price' => 'main#get_total_price'
  get '/get_ordered_list' => 'main#get_ordered_items_list'
  get '/get_total_count_items' => 'main#get_total_count_items'

  mount Ckeditor::Engine => '/ckeditor'

  # devise_for :admins
  # devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks',  registrations: "user/registrations" }
  devise_for :users, :path_names => {sign_in: "login", sign_out: "logout"},
                      :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "users/registrations" }

  devise_scope :user do
    get "admin/profile/edit", to: "users/registrations#edit"

  end
  # match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # get "admin/profile/edit", to: "user/registrations#edit", as: :edit_admin_profile
  namespace :admin do

    root to: "admin#index"

    resources :main_banners
    resources :products
    resources :restaurants
    resources :categories

    resources :carts
    resources :line_items

    resources :reviews
    resources :mail_lists

    resources :ordered_lists
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'
  post '/mcsubscribe/subscribe' => 'mcsubscribe#subscribe'
  post '/subs' => 'admin/admin#subs'
  post '/unsubs' => 'admin/admin#unsubs'

  post '/order_product' => 'main#order_product'
  post '/call_order' => 'main#call_order'


  get '/admin/purchase_history' => 'admin/admin#purchase_history', as: 'purchase_history'
  get '/admin/subscription' => 'admin/admin#subscription', as: 'subscription'


  get '/admin/users' => 'admin/admin#users_list', as: 'users_list'
  get '/test' => 'main#test_page'
  get '/reviews' => 'main#reviews'
  get '/term-of-used' => 'main#terms_of_use'
  get '/:url' => 'main#about', as: 'restaurant_about'
  get '/catalog/:restaurant/menu' => 'main#catalog', as: 'restaurant_all_menu'
  get '/catalog/:restaurant/:catalog' => 'main#catalog', as: 'restaurant_catalog'



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
