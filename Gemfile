source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'cancancan', '~> 3.3'
gem 'rubyzip', '>= 1.2.1'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: 'c8ac844'
gem 'axlsx_rails'
gem 'mini_magick', '~> 4.11'
gem 'responders', '~> 3.0', '>= 3.0.1'
gem 'cocoon', '~> 1.2', '>= 1.2.15'
gem 'simple_form'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jquery-rails', '~> 4.4'
gem 'sidekiq', '~> 6.4', '>= 6.4.1'
gem 'wicked_pdf', '~> 2.1'
gem 'wkhtmltopdf-binary', '~> 0.12.6.5'
gem 'redis', '~> 4.6'
gem 'rack', '~> 2.2', '>= 2.2.3'
gem 'connection_pool', '~> 2.2', '>= 2.2.5'
gem 'sinatra', '~> 2.0', '>= 2.0.8.1'
gem 'searchkick', '~> 4.6', '>= 4.6.3'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'pay', '~> 3.0'
gem 'braintree', '>= 4.4', '< 5.0'
gem 'paddle_pay', '~> 0.1'
gem 'receipts', '~> 1.1'
gem 'faker', '~> 2.19'
gem 'real_notification'



group :development, :test do
  gem 'letter_opener'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
