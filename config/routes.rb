Rails.application.routes.draw do
 root to: 'homes#top'
 get 'search' => 'searches#search'
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :musics do
  resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
 end

  resources :users do
  resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :contacts, only: [:new, :create]

end
