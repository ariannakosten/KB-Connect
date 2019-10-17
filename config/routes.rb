Rails.application.routes.draw do
  devise_for :students controllers: { omniauth_callbacks: 'omniauth' }
  resources :klasses
  resources :instructors
  resources :students

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
