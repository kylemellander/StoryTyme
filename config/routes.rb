Rails.application.routes.draw do
  root 'stories#index'
  resources :stories
  resources :sentences

  get '/stories/:id/full-view' => 'stories#full_view'
end
