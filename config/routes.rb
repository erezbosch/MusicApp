Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    get 'activate', on: :collection
  end

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, except: :new do
    resources :tracks, only: :new
  end

  resources :tracks, except: :new do
    post 'add_note', on: :member
  end

  resources :notes, only: :destroy

  root 'bands#index'
end
