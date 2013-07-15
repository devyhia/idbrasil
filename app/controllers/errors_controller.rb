class ErrorsController < ApplicationController
  layout 'form'
  skip_before_filter :check_auth
  
  def page_not_found
    session[:not] = "Page Not Found"
  end

  def unauthorized
  end
end
