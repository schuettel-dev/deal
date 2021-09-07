source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('./.ruby-version').chomp

# gem 'bcrypt', '~> 3.1.7'
# gem 'image_processing', '~> 1.2' # Use Active Storage variant
# gem 'redis', '~> 4.0'
gem 'bootsnap', require: false
gem 'devise'
gem 'haml-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'turbolinks'
gem 'view_component', require: 'view_component/engine'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-rails', require: false
  gem 'i18n-tasks'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
