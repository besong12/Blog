Rails.application.routes.draw do
   get 'signup', to: 'users#new'
   resources :articles
   get 'about', to: 'pages#about'
   resources :users, except: [:new]
  
   
   get 'login', to: 'sessions#new'

   root 'pages#index'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sessions#destroy'
  
  
end
