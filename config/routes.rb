Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :conversations do
    resources :messages
  end
  resources :event_dates do
    resources :guest_lists
    resources :events
  end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :comments do
        resources :events
      end
      resources :organizations do
        resources :comments
        resources :events
        resources :members_lists
        resources :users
      end
      resources :reports do
        resources :events
      end
      resources :users do
        resources :events
        resources :system_admins
        resources :mailboxes
        resources :sent_messages
        resources :event_dates
        resources :event_creators
        resources :members_lists
        resources :votes
        resources :organizations
      end
      resources :events do
        resources :guest_lists
        resources :comments
        resources :reports
        resources :users
        resources :event_creators
        resources :organizations
        resources :members_lists
        resources :votes
      end
      resources :system_admins do
        resources :users
      end
      resources :guest_lists do
        resources :events
        resources :event_dates
        resources :votes
      end
      resources :multimedia do
        resources :events
      end
      resources :reports
      resources :sent_messages do
        resources :mailboxes
        resources :users
      end
      resources :mailboxes do
        resources :sent_messages
        resources :users
      end
      resources :event_creators do
        resources :events
        resources :users
      end
      resources :members_lists do
        resources :events
        resources :users
        resources :organizations
      end
      resources :votes do
        resources :events
        resources :users
        resources :guest_lists
        resources :event_dates
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
  resources :terms
  resources :au_ps
  resources :mailboxes,defaults: { format: :html }
  resources :sent_messages,defaults: { format: :html }
  resources :event_creators, defaults: { format: :html }
  resources :members_lists, defaults: { format: :html }
end

