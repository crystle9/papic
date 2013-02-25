Papic::Application.routes.draw do
  filter :locale
  root :to => 'pages#index'
  get 'about' => 'pages#about', :as => :about
  get 'qa' => 'pages#qa', :as => :qa
  get 'contact' => 'pages#contact', :as => :contact
  get 'tutorial' => 'pages#tutorial', :as => :tutorial
  
  resources :users, :only => [:create, :show] do
    resources :user_profiles, :except => [:index, :show, :destroy]
  end
  resource :user, :only => [:edit, :update, :destroy]
  resources :user_sessions, :only => [:create]
  
  get     'signin'    => 'user_sessions#new'
  delete  'signout'   => 'user_sessions#destroy'
  get     'register'  => 'users#new'
  
  resource :contact, :only => [:new]
  resource :place, :only => [:new]
  
  resources :jobs, :except => [:destroy] do
    get 'page/:page', :action => :index, :on => :collection
    resources :resumes, :only => [:create, :update] do
      put :accept, :on => :collection
    end
  end
  
  resources :letters, :only => [:index, :create, :show] do
    get :autocomplete_user_login, :on => :collection
  end
  
  namespace :admin do
    resources :users, :only => [:index] do
      member do
        put :change_state
      end
      member do
        put :change_role
      end
    end
    resources :jobs, :only => [:destroy] do
      member do
        put :change_state
      end
    end
  end
end
