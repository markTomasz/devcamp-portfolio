Rails.application.routes.draw do
  # except: provide all routes except...
  resources :portfolios, except: [:show]

  # override URI pattern & add custom route method (now it appears as portfolio/1 rather than the plural)
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' # as: = add custom route method

  # get method '/url', to: Controller#Action
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'test', to: 'pages#test'

  resources :blogs

  root to: 'pages#home'
end
