Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'director' do
   resources :directors, except: [:index]
   resources :counselors
  end

  scope module: 'counselor' do
    resources :counselors, only: [:show, :edit, :update]
  end

  resources :users, only: [:new, :create, :edit, :update]
end
