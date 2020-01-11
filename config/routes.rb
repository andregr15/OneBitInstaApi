Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  namespace :api do
    namespace :v1 do
      concern :likeable do |options|
        shallow do
          post "/likes", { to: "likes#create", on: :member }.merge(options)
          delete "/unlikes", { to: "likes#destroy", on: :member }.merge(options)
        end
      end

      resources :home, only: :index
      resources :search, only: :index

      resources :users, only: [:show, :update] do
        resources :posts, only: :index
        resources :followings, only: %i(index create) do
	  delete "/", to: "followings#destroy", on: :collection
	end
      end

      resources :posts, only: %i(create show update destroy) do
        concerns :likeable, likeable_type: 'Post'
      end
    end
  end
end
