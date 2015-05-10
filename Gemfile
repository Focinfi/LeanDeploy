# change gem source in Linux server 
if `uname` != "Linux"
	source 'http://ruby.taobao.org'
else
	source 'https://rubygems.org'
end
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use mysql2 as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use Haml to markup
gem 'haml-rails', '~> 0.9.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use bootstap
gem 'twitter-bootstrap-rails', '~> 3.2.0'
# Use less-rails
gem 'less-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# paginate
gem 'will_paginate', '~> 3.0.7'
gem 'bootstrap-will_paginate', '~> 0.0.10'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# HTTP Reqeust
gem 'rest-client', '~> 1.7.3'

# App Server Puma 
gem 'puma'

# Deployment Mina 
gem 'mina', group: :development

# Image Process
gem 'mini_magick'

gem 'carrierwave'
# gem 'carrierwave-aliyun'

# gem 'qiniu', '~> 6.4.1'

gem 'carrierwave-qiniu', '~> 0.1.8'
# Mock Data
gem 'ffaker'

# Config file
gem "settingslogic"

# API 
gem 'lina'

# Admin
gem 'rails_admin', '~> 0.6.6'

group :development, :test do
  # unit test framkwork
  gem 'rspec-rails', '~> 3.1.0'

  gem 'factory_girl_rails', '~> 4.4.1'
  
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # 在 Model 中注释数据库类型
  gem "annotate"

  gem 'pry-rails'

  gem 'quiet_assets'

  # Visit http://localhost:3000/rails/routes and you'll see an output similar to rake routes
  gem 'sextant' 
end

