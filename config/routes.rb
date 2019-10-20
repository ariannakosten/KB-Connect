Rails.application.routes.draw do
  root to: 'home#main'
  devise_for :students 
  resources :omniauth
  resources :klasses
  resources :instructors
  resources :students

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
