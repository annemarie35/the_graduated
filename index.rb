require 'sinatra'
require './lib/parsing'
require 'rubygems'
require 'sinatra/activerecord'

configure { set :server, :puma }
set :public_folder, 'public'

class Issue < ActiveRecord::Base
end

get '/' do
  erb :index
end

post '/analyse' do
  text = analyse(params[:url_article])
  text = search_name(text)
  text
end
