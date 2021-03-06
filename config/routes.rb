Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :posts
  resources :feedbacks
  resources :home
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'home#home'

  match '/addnews',       to: 'posts#new',            via: 'get'
  match '/allnews',       to: 'posts#index',          via: 'get' 
  match '/allposts',      to: 'posts#admin',          via: 'get' 
  match '/json',          to: 'posts#json',           via: 'get' 
  match '/rss',           to: 'posts#rss',            via: 'get', :defaults => { :format => 'rss' }
  match '/xml',           to: 'posts#customxml',      via: 'get', :defaults => { :format => 'xml' }

  match '/leavefeedback', to: 'feedbacks#new',        via: 'get' 
  match '/allfeedback',   to: 'feedbacks#index',      via: 'get'

  match '/home',          to: 'home#home',            via: 'get'
  match '/cookies',       to: 'home#cookies',         via: 'get'
  match '/rules',         to: 'home#rules',           via: 'get'
  
  match '/signup',        to: 'users#new',            via: 'get'
  match '/allusers',      to: 'users#index',          via: 'get'
  match '/feedlist',      to: 'users#feedlist',       via: 'get'
  match '/myposts',       to: 'users#userposts',      via: 'get'

  match '/signin',        to: 'sessions#new',         via: 'get'
  match '/signout',       to: 'sessions#destroy',     via: 'delete'
  # Adding custom routes errors

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

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
