Rails.application.routes.draw do
  # root 'application#index'
  post '/sgwebhook', :to => 'application#sgwebhook'
end
