Rails.application.routes.draw do
  resources :portfolios

  # get method '/url', to: Controller#Action
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
