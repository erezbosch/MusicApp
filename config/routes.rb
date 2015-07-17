Rails.application.routes.draw do
  resources :users, except: [:edit, :update] do
    get 'activate', on: :collection
    get 'toggle_admin', on: :member
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
