Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  
  get 'introduction', to: "grammar_pages#introduction"
  get 'forum', to: "categories#index"
  
  resources :categories, only: :show do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
