Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :timetables, only: %i[index]
  get '/search' => 'timetables#show', as: :search_timetable_by_group
  get 'filter_student_groups_by_course' => 'timetables#filter_student_groups_by_course'
  root to: 'timetables#index'
end
