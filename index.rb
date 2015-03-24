require 'sinatra'
require './lib/parsing'
require 'rubygems'
require 'sinatra/activerecord'

configure { set :server, :puma }
set :public_folder, 'public'

class Woman < ActiveRecord::Base
	def self.levels
		levels = []
		index = 0
		last_niveau = ""
		order(:niveau).each do |woman|
			if last_niveau == woman.niveau
				levels[index] += 1
			else
				index += 1
				levels[index] = 1
			end
			last_niveau = woman.niveau
		end
		levels
	end
end

get '/' do
  erb :index
end

get '/visualize' do
	@women = Woman.order("created_at DESC")
  	@data = Woman.levels.map(&:to_s)
  	erb :visualize
end

get '/about' do
  erb :about
end

post '/analyse' do
  text = analyse(params[:url_article])
  text = search_name(text)
  text
end

post '/new_woman' do
  @woman = Woman.new(params[:woman])
    if @woman.save
      redirect "woman/#{@woman.id}"
    else
        erb :new_woman
    end
  end

get '/new_woman' do
	@woman = Woman.new
  erb :new_woman
end

get "/woman/:id" do
  @woman = Woman.find_by_id(params[:id])
  erb :woman
end

get '/woman/:id/edit' do
   @woman = Woman.find_by_id(params[:id])
   erb :edit_woman
end

post '/woman/:id/edit' do
	@woman = Woman.find_by_id(params[:id])
	@woman.update_attributes(params[:woman])
	 if @woman.save
      redirect "woman/#{@woman.id}"
    else
        erb :edit_woman
    end
 end

get '/degrees' do
	erb :degrees
end