Rails.application.routes.draw do
  get 'users/welcome'

resources :therapists

  resources :users, only: [:welcome] do
      resources :user_therapists
  end

root to: 'pages#index'



  resources :disorders
  resources :user_therapists
  resources :disorders, only: [:show] do
    resources :user_disorders, only: [:index]
  end

  resources :treatments
  resources :user_disorders
  resources :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: 'registrations' }, skip: [:sessions]
     as :user do
       get 'login' => 'devise/sessions#new', :as => :new_user_session
       post 'login' => 'devise/sessions#create', :as => :user_session
       delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
     end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
