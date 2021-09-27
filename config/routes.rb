Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :dashboards

  resources :links
  resources :link_forms, path: :links

  get ':slug', to: 'landing_pages#access'

  root 'landing_pages#index'

  namespace :api do
    post 'users/login', to: 'login#call'

    post 'links/shorten', to: 'shorten_link#call'
    get 'links', to: 'get_links#call'
    get 'links/:slug', to: 'get_link#call'

    get :version, to: 'api/application#version'
  end
end
