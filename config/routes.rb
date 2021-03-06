Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  resources :stories, only: %i(new create index edit update destroy) do
    resources :chapters, only: %i(new create index show edit update destroy)
    resources :characters, only: %i(new create index show edit update destroy)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
