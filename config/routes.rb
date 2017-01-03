Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # the do block is added only for the pin votes.
    resources :pins do
      member do
        put "like", to: "pins#upvote"
      end
    end
    
    root "pins#index"
end
