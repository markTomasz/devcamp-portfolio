Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # except: provide all routes except...
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'

  # override URI pattern & add custom route method (now it appears as portfolio/1 rather than the plural)
  # ***** route below: takes in an ID parameter, then mapped to the show action
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' # as: = add custom route method

  # get method '/url', to: Controller#Action
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'test', to: 'pages#test'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
