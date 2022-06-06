# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'jwt'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'pry', '~> 0.13.1'
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
end

group :development do
  gem 'rubocop-rails', require: false
end
