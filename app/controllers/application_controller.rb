class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :authenticate_customer!, except: [:about]
end
