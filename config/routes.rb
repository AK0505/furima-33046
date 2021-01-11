Rails.application.routes.draw do
 
  root to: 'furima#index'
  devise_for :users

end
