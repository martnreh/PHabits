Rails.application.routes.draw do
  root 'home#index'

  resources :activity_types, only: [:index, :new, :create, :destroy]
  resources :activity_logs, only: [:index, :new, :create, :destroy]
end



# Rails.application.routes.draw do
#   get 'home/index'
#   get 'activity_logs/index'
#   get 'activity_logs/new'
#   get 'activity_logs/create'
#   get 'activity_types/index'
#   get 'activity_types/new'
#   get 'activity_types/create'
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end
