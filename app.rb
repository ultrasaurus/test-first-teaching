require 'rubygems'
require 'sinatra'
require 'erector'

require 'web/home'

set :public, "web"

get '/' do
  Home.new.to_pretty
end
