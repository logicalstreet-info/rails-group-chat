Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'users', to: 'devise/session#new'
  end
  get 'user/:id', to: 'users#show', as: 'user'
  resources :groups do
    resources :messages
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
