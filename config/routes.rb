Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => "homes#about"

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
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'

  end
end
