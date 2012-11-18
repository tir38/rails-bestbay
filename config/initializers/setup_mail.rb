ActionMailer::Base.smtp_settings = {
    :address  =>  "smtp.gmail.com",
    :port  =>  587,
    :domin  =>  "gmail.com",
    :user_name  => "BestBay.tifiv",
    :password  =>  "jahtifiv",
    :authentication  =>  "plain",
    :enable_starttls_auto  =>  true
}