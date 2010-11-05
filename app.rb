# This is a trivial Sinatra app that drives testfirst.org on Heroku

require 'rubygems'
require 'sinatra'
require 'erector'

require 'web/home'

set :public, "web"

get '/' do
  Home.new.to_pretty
end
