Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'test' => 'user#register'
  end
  get 'register', to: 'authentication#register'
  post 'login', to: 'authentication#login'
end
