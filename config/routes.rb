# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#         new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
#            user_password POST   /users/password(.:format)         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                          PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#        user_registration POST   /users(.:format)                  devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                          PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)     devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
#                          GET    /users/confirmation(.:format)     devise/confirmations#show
#                api_users POST   /users(.:format)                  api/v1/users#create {:subdomain=>"api", :format=>:json}
#                 api_user GET    /users/:id(.:format)              api/v1/users#show {:subdomain=>"api", :format=>:json}
#                          PATCH  /users/:id(.:format)              api/v1/users#update {:subdomain=>"api", :format=>:json}
#                          PUT    /users/:id(.:format)              api/v1/users#update {:subdomain=>"api", :format=>:json}
#                          DELETE /users/:id(.:format)              api/v1/users#destroy {:subdomain=>"api", :format=>:json}
#             api_sessions POST   /sessions(.:format)               api/v1/sessions#create {:subdomain=>"api", :format=>:json}
#              api_session DELETE /sessions/:id(.:format)           api/v1/sessions#destroy {:subdomain=>"api", :format=>:json}
#

require 'api_constraints'

Rails.application.routes.draw do
  # Api definition
  # constraints :subdomain => 'api' do
  namespace :api, path: nil, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      resources :users
      resources :sessions, :only => [:create, :destroy]
      resources :faqs
      resources :applications
      resources :sponsors
      resource :batch
      resources :rsvps
      resources :installations
      resources :announcements
      resources :categories

      get "/map" => "pdf#index"
      get "/schedule" => "schedule#index"
      get "/prizes" => "prizes#index"

      get "/announcements" => "announcements#index"
      post "/announcements" => "announcements#create"

      get "/checkin" => "users#index_checkin"
      post "/checkin" => "users#create_checkin"
      delete "/checkin" => "users#destroy_checkin"

      post "users/request_password_token" => "users#request_password_token"
      post "users/reset_password" => "users#reset_password"
      post "users/change_password" => "users#change_password"


    end
  end
  # end

  constraints :subdomain => 'd.api' do
    namespace :api, path: nil, defaults: {format: 'json'} do
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

        resources :users
        resources :sessions, :only => [:create, :destroy]
        resources :faqs
        resources :applications
        resources :sponsors
        resource :batch
        resources :rsvps
        resources :installations
        resources :announcements
        resources :categories

        get "/map" => "pdf#index"
        get "/schedule" => "schedule#index"
        get "/prizes" => "prizes#index"

        get "/announcements" => "announcements#index"
        post "/announcements" => "announcements#create"

        get "/checkin" => "checkin#index"
        post "/checkin" => "checkin#create"
        delete "/checkin" => "users#destroy_checkin"

        post "users/request_password_token" => "users#request_password_token"
        post "users/reset_password" => "users#reset_password"
        post "users/change_password" => "users#change_password"


      end
    end
  end

  devise_for :users
end
