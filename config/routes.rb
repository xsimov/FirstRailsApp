Rails.application.routes.draw do

  resources :locations, only: [:create, :update, :show, :destroy] do
    resources :visits, only: [:create, :update, :index, :destroy]
  end
  
  resources :users, only: [:create, :update, :show, :destroy] do
    resources :visits, only: [:create, :update, :index, :destroy]
  end
  resource :search, :only => :create

end