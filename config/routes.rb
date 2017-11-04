Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :new, :show, :create, :delete ] do
    resources :doses, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end
  root 'cocktails#index'
  resources :reviews, only: [ :destroy]
  resources :doses, only: [:destroy]
end
