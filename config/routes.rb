Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :user
  resources :city
  resources :gossips do
    resources :comments
  end
  
  
  get 'welcome/:name', to: 'welcome#home', as: 'welcome'
  get 'team/team'
  resources :contacts
  #get 'contacts/contact'
  
  

  root 'gossips#index' 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
