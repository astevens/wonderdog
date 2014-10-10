class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def sgwebhook
    binding.pry
    names = DB.query("SELECT last_name FROM consumers LIMIT 10").map{|r| r[:last_name]}
    render :text => names.join(', ')
  end
end
