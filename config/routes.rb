Rails.application.routes.draw do
  resources :loads
  root to: 'main#index'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  # get 'loads', to: 'loads#new'
  # post 'loads', to: 'loads#create'
  # get '/loads/new', to: 'loads#new'
  post '/loads/new', to: 'loads#create'

  get 'loads', to: 'loads#index'
  post 'loads', to: 'loads#show'

  # get '/loads/[:id]/edit', to: 'loads#edit'
  # post '/loads/[:id]/edit', to: 'loads#edit'

  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
