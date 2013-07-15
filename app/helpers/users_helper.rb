module UsersHelper
  require "digest/sha1"
  def authenticated?
    user = session[:username]
    if user
      return user
    else
      return false
    end
  end
  def authenticate(username, password)
    u = User.find_by_username(username)    
    if u && u.password == encrypt(password)
      # register ticket
      session[:username] = u.username
      session[:rights] = u.rights
      return u
    else
      return false
    end 
  end
  def authorize?(rights)
    return session[:rights] == rights
  end
  def encrypt(text)
    Digest::SHA1.hexdigest(text)  
  end
end
