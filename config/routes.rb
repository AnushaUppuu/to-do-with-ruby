Rails.application.routes.draw do
  devise_for :users

  root "tasks#calendar"
  resources :tasks, only: [:index, :show, :new, :create, :destroy] do
    patch :complete, on: :member
  end
  

  get '/calendar', to: 'calendar#index', as: :calendar
  get '/calendar/year/:year', to: 'calendar#year', as: :calendar_by_year
  get '/calendar/year/:year/month/:month', to: 'calendar#month', as: :calendar_by_month
  get '/calendar/year/:year/month/:month/day/:day', to: 'calendar#day', as: :calendar_by_day  
end
