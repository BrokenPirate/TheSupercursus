Rails.application.routes.draw do

  resources :asks
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: {
        sessions: 'users/sessions',
   registrations: 'users/registrations' }
    
  root to: 'pages#home'
  



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    get 'ask/index'
    resources :ask

  get "/team" => "pages#team"
  get "/contact" => "pages#join_us"


  get "/courses" => "courses#index"
  get "/courses/new" => "courses#new"
  get "/courses/:id" => "courses#show"


  resources :courses
  resources :users
   devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :comments, only: :create




end
