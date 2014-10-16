Rails.application.routes.draw do
  # root 'application#index'
  post '/sendgridhook', :to => 'application#sendgridhook'
end
