SampleApp::Application.routes.draw do
  #
  # Redirect the application root to the home page.
  #
  root :to => "pages#home"

  # Resources

  #
  # Create routes to manipulate users in a RESTful manner.
  #
  # model   - app/models/user.rb
  # view    - app/views/users/
  # control - app/controls/user_controler.rb
  resources :users do
    member do
      get :following, :followers
    end
  end
  #
  # Create routes to work with sessions. 
  # Only support :new, :create, and :destroy.
  #
  # model   - none
  # view    - app/views/sessions/new.html.erb
  # control - app/controlers/sessions_controler.rb
  resources :sessions, :only   => [:new, :create, :destroy]
  #
  # Create routes to work with microposts.
  # Only support :create and :destroy.
  #
  # model   - app/models/micropost.rb
  # view    - app/views/microposts/_micropost.html.erb
  # control - app/controlers/micropost_controler.rb 
  resources :microposts, :only => [:create, :destroy]
  #
  # Create routes to work with relationships.
  # Only support :create and :destroy.
  #
  # model   - app/models/relationship.rb
  # view    - app/views/relationships/
  # control - app/controlers/relationship_controler.rb
  resources :relationships, :only => [:create, :destroy]

  # Named Routes

  #
  # Sign Up
  #
  # model   - app/models/user.rb
  # view    - app/views/users/new.html.erb
  # control - app/conrols/user_controler.rb
  #           function - new
  match '/signup',  :to => 'users#new'
  #
  # Sign In
  #
  # model   - ???
  # view    - app/views/sessions/new.html.erb
  # control - app/controls/session_controler.rb
  match '/signin',  :to => 'sessions#new'
  #
  # Sign Out
  #
  # model   - ???
  # view    - redirects to root_path
  # control - app/controls/session_controler.rb
  match '/signout', :to => 'sessions#destroy'
  #
  # Contact Page (static)
  #
  # view - app/views/pages/contact.html.erb
  match '/contact', :to => 'pages#contact'
  #
  # About Page (static)
  #
  # view - app/views/pages/about.html.erb 
  match '/about',   :to => 'pages#about'
  #
  # Help Page (static)
  #
  # view - app/views/pages/help.html.erb
  match '/help',    :to => 'pages#help'
  #
  # Create a route to show only portfolio managers
  #
  # model   - app/models/user.rb
  #           portfolio_managers are in the User table but have
  #           the portfolio_manager flag set to true.
  # view    - app/view/users/portfolio_managers.html.erb.
  # control - app/controls/user_controler.rb
  match '/portfolio_managers' => 'users#portfolio_managers'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
