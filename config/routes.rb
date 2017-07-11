Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
      registrations: 'admins/registrations'
  }
  devise_for :super_admins, controllers: {
      registrations: 'super_admins/registrations'
  }


  authenticated :super_admin do
    root to: 'pages#super_admin_dashboard'
  end

  authenticated :admin do
    root to: 'pages#admin_dashboard'
  end

  authenticated :user do
    root to: 'pages#home'
  end

  unauthenticated do
    root to: 'pages#index'
  end

  namespace :admins do
    resources :users, only: [:new, :create]
  end

  namespace :super_admins do
    resources :businesses, only: [:update]
  end

  resources :businesses

  get 'pages/contact'

  get 'pages/about'

  get 'pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
