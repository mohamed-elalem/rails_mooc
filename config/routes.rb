Rails.application.routes.draw do
  resources :feedbacks
  resources :replies
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  #devise_for :users
  resources :roles
  #devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :comments
  resources :lectures
  resources :lectures
  resources :lectures, only: [:index, :show] do
    member do
      put :like
    end
    member do
      delete :unlike
    end
    member do
      put :spam
    end
    member do
      delete :unspam
    end
    member do
      post :comment
    end
  end
  resources :courses
  resources :courses, only: [:index, :show] do
    member do
      get :new_lecture
    end
    member do
      post :create_lecture
    end
    member do
      post :add_comment
    end
    
  end
  
  resources :roles

  root 'courses#index'
  
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
  #     #     resources :sales do
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
