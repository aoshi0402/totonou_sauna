Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => "homes#about"
   get 'login/select' => 'homes#login_select', as: 'login_select'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  	namespace :admin do
		get 'top', to: 'homes#top'
    resources :genres, only: [:create, :index, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update] do
			collection { post :import }
		end
  end

  namespace :user do
    resources :saunas, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :foods
			resource :ikitais, only: [:create, :destroy]
			resources :reviews do
				resource :likes, only: [:index, :create, :destroy]
				resources :comments, only: [:create, :edit, :update, :destroy]
			end
		end

    resources :users, only: [:show, :edit, :update, :destroy]
    resource :relationships, only: [:create, :destroy]
    resources :messages, only: [:create, :destroy]
    resources :rooms, only: [:create, :show, :index]
    resources :notifications, only: [:index, :destroy]
    resources :contacts, only: [:new, :create]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'

  end
end
