source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'aasm'
gem 'activeadmin'
gem 'activeadmin_simplemde'
gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap'
gem 'country_select', '~> 6.0'
gem 'devise'
gem 'draper'
gem 'erubis'
gem 'ffaker'
gem 'haml'
gem 'haml-rails', '~> 2.1'
gem 'html2haml', require: false
gem 'image_processing'
gem 'jbuilder', '~> 2.7'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
gem 'pg', '~> 1.4', '>= 1.4.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.7'
gem 'redcarpet'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_consistency', group: :development, require: false
  gem 'fasterer', '~> 0.10.0'
  gem 'overcommit', '~> 0.59.1'
  gem 'rubocop-performance', '~> 1.15'
  gem 'rubocop-rails', '~> 2.16', '>= 2.16.1'
  gem 'rubocop-rspec', '~> 2.13', '>= 2.13.2'
end

group :development do
  gem 'brakeman', '~> 5.3', '>= 5.3.1'
  gem 'bullet'
  gem 'bundler-audit', '~> 0.9.1'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.26'
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec', '~> 3.11'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'site_prism', '~> 3.7', '>= 3.7.3'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
