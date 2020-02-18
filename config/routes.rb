Rails.application.routes.draw do


    
    root to: 'toppages#index'
    get 'ranking', to: 'ranks#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    get 'signup', to: 'users#new'
    
    get 'searchname', to: 'searches#searchname'
    get 'searchpre', to: 'searches#searchpre'
    
    resources :users, only: [:edit, :create, :update]
    resources :spots, only: [:edit, :create, :update, :new, :index, :show]do
        member do
            get :spot_review
        end
    end
    resources :reviews, only: [:edit, :update, :create, :new, :index, :destroy, :show]
end
