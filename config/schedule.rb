# for creating cron jobs

# to turn this into cron job run from command line in rails run:
# whenever --update-crontab bestBay


# set the cron log location
set :output, {:error => '/home/jason/bestbay/log/cron_error.log', :standard => '/home/jason/bestbay/log/cron_status.log'}
set :job_template, "bash -i -c ':job'"
env :PATH, ENV['PATH']

every 1.minute do
  #command "echo $PATH"                             # confirm shell variable PATH was loaded
  #command "cd #{path}"                             # this is not needed
  #command "pwd"                                    # visualize current directory
  #command "rvm current"                            # visualized default ruby version and gemset
  command "rvm use ruby-1.9.3-p194@cmucourse"       # set desired gemest
  #command "rvm current"                            # visualize proper gemset load

  runner "AuctionsHelper.checkForExpiredAuction", :environment => 'development' # run method
end