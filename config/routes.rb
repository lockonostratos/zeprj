Zeprj::Application.routes.draw do
  root :to => 'home#welcomes', as: 'welcomes'
  get 'welcome', :to => 'home#welcome', as: 'welcome'
  get 'signin', :to => 'sessions#new', as: 'signin'
  get 'signout', :to => 'sessions#destroy', as: 'signout'
  get 'signup', :to => 'accounts#new', as: 'signup'

  get 'warehouse/home', :to => 'warehouse#home'

  resources :accounts
  resources :sessions
  resources :products
  resources :merchants


  get 'warehouses/available', :to => 'warehouses#available'
  get 'product_summaries/import_availables', :to => 'product_summaries#import_availables'
  get 'productSummaries/import_availables', :to => 'product_summaries#import_availables'

  get 'areas/showAllCustomers', :to => 'areas#showAllCustomers'
  get 'areas/showAllCustomers/:id', :to => 'areas#showAllCustomers'
  get 'warehouses/search', :to => 'warehouses#search'
  get 'product_summaries/search', :to => 'product_summaries#search'
  get 'orders/bill_code', :to => 'orders#bill_code'


  resources :gera_accounts
  resources :gera_areas
  resources :gera_customers
  resources :areas
  resources :agencies
  resources :merchant_accounts
  resources :customers


  resources :branches
  resources :warehouses
  resources :skulls
  resources :providers
  resources :product_summaries
  resources :metro_summaries

  resources :imports
  resources :deliveries
  resources :exports
  resources :export_details
  resources :inventories
  resources :inventory_details
  resources :orders
  resources :order_details
  resources :returns
  resources :return_details
  resources :temp_products
  resources :temp_inventory_details

  resources :roles
  resources :role_permissions
  resources :merchant_account_roles
  resources :merchant_account_permissions
  resources :merchant_account_permission_details
  resources :permissions
  resources :permission_details

  resources :mackay_profiles
  resources :mackay_families
  resources :mackay_educations
  resources :mackay_personals
  resources :mackay_children
  resources :mackay_life_styles
  resources :mackay_hobbies
  resources :mackay_careers
  resources :mackay_and_companies



  resources "merchantAccounts", :controller => :merchant_accounts, :as => :merchant_accounts
  resources "productSummaries", :controller => :product_summaries, :as => :product_summaries
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
