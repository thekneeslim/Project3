Rails.application.routes.draw do

  root 'main#index'
  get "browse" => "main#browse"
  get "/profile/:id" => "students#profile"
  # get "profile/graduate=:id" => "main#profile"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "students/:id/education" => "students#education"
  get "students/:id/profile_pic" => "students#profile_pic"
  get "students/search" => "students#search"
  get "events/search" => "events#search"

  resources :events
  resources :works
  resources :students
  resources :languages
  resources :courses
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
