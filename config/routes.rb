Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :schedules
    resources :users
    resources :events
  end
end
