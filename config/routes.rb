Rails.application.routes.draw do
  root 'map#show'
  get 'loggedin', to: 'map#loggedin'
  get 'search', to: 'map#search'
  resources :map, :path => ''
end
