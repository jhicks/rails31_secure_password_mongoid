MongoidMembership::Application.routes.draw do
  resources :sessions

  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create", :as => "login"

  root :to => 'pages#index'
end
