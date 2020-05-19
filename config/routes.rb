Rails.application.routes.draw do
  resources :recipes do
    resources :ratings, only: [:create, :new]
  end
  devise_for :users
  root to: 'public#main'

  resources :tags, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
