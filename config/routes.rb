Rails.application.routes.draw do
  # get 'root/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get 'hello_world', to: 'hello_world#index'
  root 'root#index'

  namespace :api do
    namespace :v1 do
      resources :greetings
      # resources :greetings, param: :message
    end
  end

  # get '*path', to: 'pages#index', via: :all
end
