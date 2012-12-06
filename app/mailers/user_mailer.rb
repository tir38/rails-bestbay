class UserMailer < ActionMailer::Base
  default from: "BestBay.tifiv@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end


  def endAuction_confirmation (user, auction)

    puts 'inside endAuction_confirmation'
    # actually send the email

  end
end

