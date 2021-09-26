Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :dashboards

  root 'dashboards#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :version, to: 'api/application#version'

  # root 'api/application#healthz'
end
