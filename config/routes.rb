Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
  end

  scope module: 'counselor', path: 'c' do
    resources :counselors, only: [:show, :edit, :update]
  end

  scope module: 'parent', path: 'p' do
    resources :kids
    resources :parents, only: [:new, :create, :show]
  end

  resources :users, only: [:new, :create, :edit, :update]
end
