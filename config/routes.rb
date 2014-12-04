Rails.application.routes.draw do
  resources :todoas

  get 'sessions/new'

  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'today'  => 'todoas#today'
  get 'week'  =>  'todoas#week'
  get 'done'  =>  'todoas#done'
  resources :users
end