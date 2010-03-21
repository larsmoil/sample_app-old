module SessionsHelper
  def sign_in(user)
    user.remember_me!
    session[:secret] = user.remember_token
    session[:expire_after] = 20.years.from_now.utc
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def user_from_remember_token
    remember_token = session[:secret]
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    session[:secret] = nil
    self.current_user = nil
  end
end
