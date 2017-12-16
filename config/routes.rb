Rails.application.routes.draw do

	resources :articles
	resources :users, except: [:new]
	get 'welcome/home', to: 'welcome#home'
	get 'welcome/about', to: 'welcome#about'

	root 'pages#home'
	get 'about', to: 'pages#about'

	get 'signup', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
