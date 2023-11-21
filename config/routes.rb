Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get "/upload", to: "upload#new"
  post "/upload", to: "upload#create"
  resources :transactions, only: :show do
    member do
      get :statements
    end
  end
end
