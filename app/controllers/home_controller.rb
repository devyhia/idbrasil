class HomeController < ApplicationController
  
  include UsersHelper
  before_filter :check_auth, :except => [ :login , :attempt_login , :logout ]
  before_filter :check_rights, :except => [ :login, :attempt_login, :logout ]
  
  def index
    
  end

  
  def login
    render :layout => "form"  
  end
  
  def attempt_login
    user = authenticate(params[:username], params[:password])
    if user
      redirect_to "/"
    else
      flash[:notice] = "Invalid Username/Password Combination"
      redirect_to "/login" 
    end
  end

  def logout
    session[:username] = nil
    session[:rights] = nil
    redirect_to "/login"
  end
  
  private # filters
  def check_auth
    if !authenticated?
      redirect_to "/login"
    end
  end
  def check_rights
    if !(authorize?("User") || authorize?("Admin"))
      redirect_to "/errors/unauthorized"
    end
  end
end
