Rails.application.routes.draw do
  resources :students
  resources :classrooms do
    resources :lessons, only: [ :new, :create, :edit, :update, :show, :delete ]
  end
  root "pages#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
