Rails.application.routes.draw do
  # get 'root/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'root#index'
  # get 'greetings/random'

  namespace :api do
    namespace :v1 do
      resources :greetings
      # resources :greetings, param: :message
    end
  end

  # get '*path', to: 'pages#index', via: :all
end
