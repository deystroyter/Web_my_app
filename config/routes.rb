Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    match 'next_image', to: 'api#next_image',   via: :get
    match 'prev_image', to: 'api#prev_image',   via: :get
    match 'savg_value', to: 'api#savg_value',   via: :get
  end

  # work
  match 'work', to: 'work#index', via: 'get'
  match 'choose_theme', to: 'work#choose_theme', via: :get
  match 'display_theme', to: 'work#display_theme', via: :post
  get 'work/index'
  get 'work/choose_theme'
  post 'work/display_theme'

  match 'signup',   to: 'users#new',            via: 'get'
  match 'signin',   to: 'sessions#new',         via: 'get'
  match 'signout',  to: 'sessions#destroy',     via: 'delete'

  resources :themes
  resources :values
  resources :images
  resources :users
  resources :sessions

  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'

  root 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
