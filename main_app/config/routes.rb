Sandbox::Application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/spree'
  match 'access_child_dropdown/:t_id' => 'spree/taxons#access_child_dropdown'

  match '/filter_group/:id' => 'spree/taxons#filter_group', :as => :filter_group

  #Routes for Static Pages
  get 'helpdesk-support' => 'static_pages#helpdesk_support' ,:as => 'helpdesk_support'
  get 'careers' => 'static_pages#careers', as: 'career'  
  get 'contact' => 'static_pages#contact_us', as: 'contact_us'
  get 'corporate' => 'static_pages#corporate', as: 'corporate'
  get 'helpdesklivechat' => "static_pages#helpdesklivechat", as: 'helpdesklivechat'
  get 'helpdesk-tickets' => 'static_pages#helpdesk_tickets', as: 'helpdesk_ticket'
  get 'helpdesk-timebound' => 'static_pages#helpdesk_timebound',as: 'helpdesk_timebound'
  get 'teamplan' => 'static_pages#teamplan',as: 'teamplan'
  get 'voice-of-customers' => 'static_pages#voice_of_customers' , as: 'voice_of_customers'
  get 'whysupportsages' => 'static_pages#whysupportsages', as: 'whysupportsages'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static_pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
