require 'rubygems'
require 'sinatra'

set :public, Proc.new { root }

get '/' do
  erb :home 
end
