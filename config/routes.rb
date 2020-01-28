# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  get "login", to: "sessions#new"
  get "admin", to: "sessions#admin"
  get "logout", to: "sessions#logout"
  post "login", to: "sessions#create"

  get "bulletin", to: "generators#bulletin", as: "bulletin"

  resources :projects
  resources :generators

  root "generators#index"
end
