Rails.application.routes.draw do

  get "red/:url" , to: "redirects#red"

  resources :redirects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end