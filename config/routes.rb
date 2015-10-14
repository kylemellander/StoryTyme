Rails.application.routes.draw do
  root 'stories#index'
  resources :stories
  resources :sentences
end
