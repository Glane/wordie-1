Wordie::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  get "/users/:id/wordie" => "users#wordie", as: "wordie"
end