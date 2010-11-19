ActionController::Routing::Routes.draw do |map|

  map.resource :account, :controller => "users"
  
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login "login", :controller => "user_sessions", :action => "new"
  map.browse "browse", :controller=>"browse",:action=>"all"

  map.resources :users
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"

  map.resources :playlists_songs

  map.resources :playlists
  map.resources :playlists, :collection => { :popular => :get, :my => :get }
  map.resources :songs, :collection => { :popular => :get, :my => :get }
  map.resources :songs
  
  map.resources :users_songs
 

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
      
     map.connect 'comment/song/new/:song_id', :controller => 'song_comment', :action => 'new'
     map.connect 'comment/song/create/:song_id', :controller => 'song_comment', :action => 'create'
     map.connect 'comment/playlist/new/:song_id', :controller => 'playlist_comment', :action => 'new'
     map.connect 'comment/playlist/create/:song_id', :controller => 'playlist_comment', :action => 'create'
     

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
