Rails.application.routes.draw do



  ### CHANGED added our custom 'registrations' controller to Devise in order to allow 'username'
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'pages#home'

  resources :users, only: [:show, :index]

  resources :friendships, only: [:create, :destroy, :accept] do
    member do
      #custom action (outside CRUD) for accepting friendship
      put :accept
    end
  end

  resources :posts, only: [:create, :show, :edit, :update, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :activities, only: [:index]

end
