Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :articles
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end

# resources : it helps in getting all routes associated to articles contoller without coding explicitly