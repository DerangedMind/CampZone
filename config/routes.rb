Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  scope module: 'director', path: 'd' do
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

  scope module: 'counselor', path: 'c' do
    resources :groups, only: [:show]
    resources :kids, only: [:show]
    resources :parents, only: [:show]
    get "profile", to: 'counselors#show'
    get "settings", to: 'counselors#edit'
    put "profile", to: 'counselors#update'
  end

  scope module: 'parent', path: 'p' do
    resources :kids
    resources :parents, only: [:new, :create, :show]
    get "profile", to: 'parents#show'
    get "settings", to: 'parents#edit'
    put "profile", to: 'parents#update'
  end

  resources :users, only: [:new, :create, :edit, :update]
end
