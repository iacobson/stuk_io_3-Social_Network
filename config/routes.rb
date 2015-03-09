Rails.application.routes.draw do

  ### CHANGED added our custom 'registrations' controller to Devise in order to allow 'username' 
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'pages#home'

end