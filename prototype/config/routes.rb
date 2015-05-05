Rails.application.routes.draw do

  resources :activities

  resource :dashboard, only: [:show]
  resources :replies, only: [:new, :create]
  resources :questions, only:[:new, :create]
  resources :offers
  post 'dashboard/offers/:id/reject' => 'offers#reject', as: 'reject_offer'
  post 'dashboard/offers/:id/accept' => 'offers#accept', as: 'accept_offer'
  devise_for :users

  resources :listings do
    get 'offer' => 'offers#new'
    post 'process' => 'offers#create'
  end

  root 'listings#index'
end