module SessionsHelper

  def sign_in(user)
    puts "****in the sign_in(user) method*****"
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    puts "****in the singed_in? method*****"
    puts !current_user.nil?
    !current_user.nil?
  end

  def current_user=(user)
    puts "****in the current_user=(user) method*****"
    @current_user = user
  end

  def current_user
    puts "****in the current_user method*****"
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    puts "****in the sign_out method*****"
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
