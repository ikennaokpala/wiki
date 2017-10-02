Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles, only: %w(index new show create)
  resources :programming_languages, only: %w(new create)
  resources :users, only: %w(new create) do
    collection do
      resources :forgot_password, only: %w(new create)
    end
  end
  resources :sessions, only: %w(new create)
end
