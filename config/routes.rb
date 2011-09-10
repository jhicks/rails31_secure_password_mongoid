MongoidMembership::Application.routes.draw do
  resources :sessions
  resources :registration

  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create", :as => "login"

  get "signup" => "registration#new", :as => "signup"
  post "signup" => "registration#create", :as => "signup"

  root :to => 'pages#index'
end
