Rails.application.routes.draw do
  root 'map#show'
  get 'search', to: 'map#search'
  
  resources :users
  get 'loggedin' => 'users#loggedin'
  
  get 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
