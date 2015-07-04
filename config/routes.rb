Rails.application.routes.draw do
  root 'map#show'
  get 'loggedin', to: 'users#loggedin'
  get 'search', to: 'map#search'
  #resources :map, :path => ''
  resources :users
end
