require 'sidekiq/web'
Rails.application.routes.draw do

  get 'businesses/invoices'
  get 'jobs/show'

  devise_for :transcribers, controllers: {
      registrations: 'transcribers/registrations'
  }
  resources :transcribers
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
  }
  devise_for :super_admins, controllers: {
      registrations: 'super_admins/registrations'
  }

  resources :types
  resources :plans


  authenticated :super_admin do
    root to: 'pages#super_admin_dashboard'
  end

  authenticated :transcriber do
    root to: 'pages#transcriber_dashboard'
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

  root to: 'pages#index'

  namespace :admins do
    resources :users, only: [:new, :create]
  end

  namespace :super_admins do
    resources :businesses, only: [:update, :index]
  end

  resources :businesses
  resources :admins
  resources :uploads
  resources :users, only:[:show, :update]



  get '/pricing', to: 'businesses#pricing'

  get 'pages/contact'

  get 'pages/about'

  get 'pages/help'

  resources :payments
  mount Sidekiq::Web => '/sidekiq'

  get 'transcribers/job/(:id)', to: 'transcribers#job',as: :show_transcriber_job

  match 'jobs/(:id)', to: 'transcribers#update_job', via: :patch

  resources :jobs
  resources :conversations
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
