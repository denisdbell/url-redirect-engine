Rails.application.routes.draw do

  resources :redirect_logs
  post "perform_redirect" , to: "redirects#perform_redirect", :defaults => { :format => 'json' }

  resources :redirects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end