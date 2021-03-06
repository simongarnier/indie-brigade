Rails.application.routes.draw do
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'users', only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  resources :devs, controller: 'devs', only: [:show]

  get '/sign_in'  => 'clearance/sessions#new', as: 'sign_in'
  get '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up'  => 'clearance/users#new', as: 'sign_up'

  get '/account/user/edit'  => 'users#edit', as: 'user_edit'
  put '/account/user'       => 'users#update', as: 'user_update'

  get '/account/dev/edit'                             => 'devs#edit', as: 'dev_edit'
  get '/account/dev/remove_availability'              => 'devs#remove_availability'
  get '/account/dev/additional_availability'          => 'devs#additional_availability'
  put '/account/dev'                                  => 'devs#update', as: 'dev_update'

  ActiveAdmin.routes(self)

  get '/welcome', to: 'welcome#show', as: 'welcome'
  get '/welcome/edit', to: 'welcome#edit', as: 'welcome_edit'

  root 'welcome#show'

  get '/devs/:dev_id/skills', to: 'settings#edit_skills', as: 'setting_edit_skills'
  get '/search', to: 'settings#search', as: 'search'
  get '/message', to: 'settings#message', as: 'message'
  get '/watchlist', to: 'settings#watchlist', as: 'watchlist'
  put '/devs/:dev_id/skills', to: 'settings#update_skills', as: 'setting_update_skills'


  # root 'welcome#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'index#index'

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
