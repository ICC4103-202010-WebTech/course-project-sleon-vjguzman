Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :events do
        resources :comments
        resources :multimedia
      end
      resources :comments
      resources :organizations do
        resources :comments
      end
      resources :users
      resources :events do
        resources :guest_lists
      end
      resources :system_admins
      resources :guest_lists do
        resources :events
      end
      resources :multimedia
      resources :event_dates do
        resources :events
      end
      resources :guest_lists do
        resources :events
      end
      resources :multimedia
      resources :event_dates
      resources :votes do
        resources :guest_lists
      end
      resources :votes do
        resources :events
        resources :guest_lists
      end
    end
  end
  resources :events, defaults: { format: :html }
  resources :comments, defaults: { format: :html }
  resources :organizations, defaults: { format: :html }
  resources :system_admins, defaults: { format: :html }
  resources :users, defaults: { format: :html }
  resources :guest_lists, defaults: { format: :html }
  resources :multimedia, defaults: { format: :html }
  resources :event_dates, defaults: { format: :html }
  resources :votes,defaults: { format: :html }
  resources :searches
end

