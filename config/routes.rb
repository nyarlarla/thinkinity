Rails.application.routes.draw do
	root to: 'homes#top'
	get '/home/about' => 'homes#about'
	devise_for :users
	resources :users do
      get :followings
      get :followers
      get :likes
	end
	resources :genres
	get 'tags/:tag', to: 'idea_boards#index', as: :tag
	resources :idea_boards do
		resources :comments, only: [:create, :destroy]
	end
	resources :favorites, only: [:index, :create, :destroy]
	resources :messages, only: [:create]
  	resources :rooms, only: [:create, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
