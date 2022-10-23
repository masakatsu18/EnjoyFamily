Rails.application.routes.draw do
  get 'events/index'
  get 'contacts/index'
  post 'contacts/done'
  post 'contacts/confirm'
  get "search" => "searches#search"
  resources :groups do      
    get "join" => "groups#join"
    delete "disjoin" => "groups#disjoin"
  end
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
   resources :customers
  end
  
  scope module: :public do
   root to: 'customers#show'
   resources :customers
   resources :events
  end# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
