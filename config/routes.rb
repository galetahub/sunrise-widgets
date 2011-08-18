Rails.application.routes.draw do
  namespace :manage do
    resources :widgets
  end
end
