source "https://rubygems.org"

ruby "2.4.2"

gem "delayed_job_active_record"
gem "newrelic_rpm", ">= 3.9.8"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "database_cleaner"
  gem "launchy"
  gem "shoulda-matchers"
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
