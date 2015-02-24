source 'https://rubygems.org'

ruby '2.1.3'

gem "rack"
gem "sinatra", git: 'https://github.com/sinatra/sinatra.git'
gem "activesupport"
gem "puma"
gem "rake"
gem "sinatra-activerecord"
gem "activerecord"
gem 'sendgrid-ruby'
gem 'nokogiri'

group :production do
  gem "pg"
end

group :development do
  gem "sinatra-reloader" #vérifier si ça fonctionne bien avec puma
end

group :test do
  gem "rspec"
  gem "rack-test"
end
