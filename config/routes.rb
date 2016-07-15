Rails.application.routes.draw do  
  devise_for :users
  root 'welcome#index'
  
  get 'introduction', to: "grammar_pages#introduction"
  get 'orthography', to: "grammar_pages#orthography"
  get 'phonology', to: "grammar_pages#phonology"
  get 'sound_changes', to: "grammar_pages#sound_changes"
  get 'personal_pronouns', to: "grammar_pages#personal_pronouns"
  get 'forum', to: "categories#index"
  
  resources :categories, only: :show do
    resources :posts do
      resources :comments
    end
  end
  
  resources :users, only: :show do
    resources :bios, only: [:new, :create, :edit, :update]
  end
  
  resources :user_notifications, only: :destroy
  
  get 'responsive/:action', :controller => :responsive
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
