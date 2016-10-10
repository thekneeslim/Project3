Rails.application.routes.draw do

  root "main#landing"
  
  get "index" => 'main#index'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :admins
  resources :students
  resources :languages
  resources :courses
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
