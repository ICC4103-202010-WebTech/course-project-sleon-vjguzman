Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
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
      resources :users do
        resources :events
        resources :system_admins
      end
      resources :events do
        resources :guest_lists
        resources :comments
        resources :reports
        resources :users
      end
      resources :system_admins do
        resources :users
      end
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
      resources :sent_messages do
        resources :mailboxes
      end
      resources :mailboxes do
        resources :sent_messages
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
  resources :reports,defaults: { format: :html }
  resources :searches
  resources :mailboxes,defaults: { format: :html }
  resources :sent_messages,defaults: { format: :html }
end

