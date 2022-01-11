Rails.application.routes.draw do
 root to: 'homes#top'
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :users

 resources :musics do
  resources :comments, only: [:create, :destroy]
 end
end
