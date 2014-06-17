require 'sinatra'

configure :development do

  require 'pry'
end

get '/' do

  erb :index
end

get '/about' do

  erb :about
end
