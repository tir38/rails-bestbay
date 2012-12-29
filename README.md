== Welcome to Bestbay ===
Bestbay is a place for people to sell their items and bid on items sold by others.
This website, while fully functional, was designed as part of a RoR course.

Feel free to browse around and check out our work.

- thanks tFiv


== How To Use ==
The complete basic process of selling/bidding is implemented.
Feel free to create an account, you'll need one to experience the full capabilities of the site.
After signing up, you can post items for sale, bid on others items, or just track items you might be interested in.

== About the code ==
We have attempted to create test coverage over all critical aspects of the code.
We have focused on a



== To use locally ===
If you wish to grab this repo and run it locally you'll need a few things:
1. Not everything is contained in this repo: You will need the following external software:
    A. ImageMagick
    B. Cron job scheduler
    C. Ruby/Rails...obviously

2. Get gems. We have maintained our gem list carefully with our Gemfile.
    A simple "bundle install" will get you what you need.

3. Create Cron Job. Using whenever gem (part of gem list) run "whenever --update-crontab bestBay".
    This will create the cron job needed for the background recurring tasks.
    Running "crontab -l" in your -nix shell will show you that everything is working.

4. Build database. You know this one; its easy; use it: "rake db:setup"

5. Enjoy!

