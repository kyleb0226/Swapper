Rails.application.routes.draw do
  root to: "main#index"

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"#goes to page
  post "password/reset", to: "password_resets#create"#sends email for reset

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "sign_up" ,to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in" ,to: "sessions#new"#go to sign in page
  post "sign_in", to: "sessions#create"#sign user in request

  delete "logout", to: "sessions#destroy"

  get "employee_database", to: "employee_database#new"#goes to employee management area
  post "employee_database", to: "employee_database#create" , as: :add_employee

  get "employee_viewer", to: "employee_viewer#index", as: :employee_view

  get "employee_match", to: "employee_match#create"



  get "matches/:id", to: "employee_match#destroy", as: :delete_match


  get "/employees/:id", to: "employee#show", as: :employee



  #to update the true or false status of a match
  resources :employee_match do
    patch 'complete', on: :member
    patch 'uncomplete', on: :member
  end
  resources :employee_match do
    patch 'manual', on: :collection
  end

  patch "employee_match", to: "employee_match#manual", as: :manual_employee_match
  

  get '/employee_match', to: 'employee_match#index'

  
end
