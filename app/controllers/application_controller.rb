class ApplicationController < ActionController::Base
  protect_from_forgery
  include UsersHelper
  before_filter :check_auth
  private
  def check_auth
    if !authenticated?
      redirect_to "/login"
    end
  end
end
