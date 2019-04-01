Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :timetables, only: %i[index]
  get '/search' => 'timetables#show', as: :search_timetable_by_group
  root to: 'timetables#index'
end
