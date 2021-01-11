Rails.application.routes.draw do
 
  root to: 'furima#index'
  devise_for :users
  resources :items, only: [:index, :new, :create, :edit]

end
