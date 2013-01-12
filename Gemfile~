source 'https://rubygems.org'

# all groups
gem 'rails', '3.2.8'
gem 'bootstrap-sass', '2.0.4'
gem 'jquery-rails'
gem 'annotate', ">=2.5.0"
gem 'bcrypt-ruby', '3.0.1'
gem 'launchy'
gem 'whenever'
gem "paperclip", "~> 3.0"

gem "rmagick", "2.12.0", :require => 'RMagick'
# you may need to "maunally" install some image magick prerequisites:
# http://stackoverflow.com/questions/5201689/rmagick-gem-install-cant-find-magick-config

group :development, :test do
  gem 'sqlite3'
  gem 'capybara' , '1.1.3'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

#suggested gems by Todd
gem 'factory_girl_rails' 
gem 'rspec-rails' 
gem 'devise'