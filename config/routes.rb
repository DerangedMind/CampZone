Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  scope module: 'director', path: 'd', as: 'director' do
    resources :directors, except: [:index]
    resources :counselors
    resources :camps
    resources :groups
    resources :kids
    resources :dashboard, only: [:index]
    get "profile", to: 'directors#show'
    get "settings", to: 'directors#edit'
    put "profile", to: 'directors#update'
  end

  scope module: 'counselor', path: 'c', as: 'counselor' do
    resources :groups, only: [:show]
    resources :kids, only: [:show]
    resources :parents, only: [:show]
    get "profile", to: 'counselors#show'
    get "settings", to: 'counselors#edit'
    put "profile", to: 'counselors#update'
    get :confirm_email
  end

  scope module: 'parent', path: 'p', as: 'parent' do
    resources :kids
    resources :parents, only: [:new, :create, :show]
    get "profile", to: 'parents#show'
    get "settings", to: 'parents#edit'
    put "profile", to: 'parents#update'
  end
end
