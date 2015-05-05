Rails.application.routes.draw do
  root 'map#show'
  resources :map, :path => ''
end
