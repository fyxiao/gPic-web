Rails.application.routes.draw do
  root 'map#show'
  get 'loggedin', to: 'map#loggedin'
  resources :map, :path => ''
end
