Rails.application.routes.draw do
  get 'bookmarks/destroy'
  get 'bookmarks/new'
  get 'bookmarks/create'
  # lists #index, #show, #new, #create
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
