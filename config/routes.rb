Rails.application.routes.draw do
  get "portal/index"
  resource :session
  resources :passwords, param: :token
  resource :sign_up

  namespace :settings do
    resource :email, only: [ :show, :update ]
    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update ]
    resource :user, only: [ :show, :destroy ]

    root to: redirect("/settings/profile")
  end

  namespace :email do
    resources :confirmations, param: :token, only: [ :show ]
  end

  get "/picop/stations/import", to: "picop/stations#import", as: "station_import"
  post "/picop/stations/upload", to: "picop/stations#upload"

  namespace :picop do
    resources :operators
    resources :regions
    resources :stations
    resources :users
  end

  get "/stations", to: "stations#index"
  get "/stations/:crscode", to: "stations#show", as: "station"
  get "/stations/:crscode/visits/new", to: "visits#new", as: "new_station_visit"

  get "/operators", to: "operators#index"
  get "/operators/:id", to: "operators#show", as: "operator"

  get "/regions", to: "regions#index"
  get "/regions/:id", to: "regions#show", as: "region"

  resources :visits, only: [ :new, :create, :update, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "portal#index"
  get "/missing", to: "portal#missing"
end
