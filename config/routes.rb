Rails.application.routes.draw do
devise_for :users, :controllers => {:registrations => "registrations"}
root to: 'pages#index'

  resources :disorders
  resources :users do
    resources :user_disorders, only: [:index]
  end
  resources :treatments
  resources :user_disorders




  # get 'user_disorders/index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
