Rails.application.routes.draw do
  get 'events/index'
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
