Rails.application.routes.draw do
  root to: "homes#top"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :index, :update]
  
  get "/home/about" => "homes#about" ,as: "about"
end
