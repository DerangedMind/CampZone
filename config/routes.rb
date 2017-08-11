Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  scope module: 'director' do
   resources :directors, except: [:index]
  end

  scope module: 'parent' do
    resources :kids
  end

  resources :users, only: [:new, :create, :edit, :update]

end
