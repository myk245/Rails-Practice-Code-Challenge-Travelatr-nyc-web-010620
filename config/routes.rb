Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  patch 'posts/:id/like', to: 'posts#updated_likes', as: :likes
  
  resources :destinations

  
end
