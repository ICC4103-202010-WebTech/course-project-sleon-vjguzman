Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :comments do
        resources :events
      end

      resources :organizations do
        resources :comments
      end
      resources :reports do
        resources :events
      end
      resources :users
      resources :events do
        resources :guest_lists
        resources :comments
        resources :reports
      end
      resources :system_admins
      resources :guest_lists do
        resources :events
        resources :event_dates
      end
      resources :multimedia do
        resources :events
      end
      resources :event_dates do
        resources :events
      end
      resources :guest_lists do
        resources :events
      end
      resources :event_dates
      resources :votes do
        resources :events
        resources :guest_lists
        resources :event_dates
      end
      resources :reports
      resources :mailboxes
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
  resources :reports,defaults: { format: :html }
  resources :searches
  resources :mailboxes,defaults: { format: :html }
end

