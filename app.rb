# This is a simple Sinatra app that drives testfirst.org on Heroku
here = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'erector'

$: << "#{here}/web"
require "page"
require "home"
require "about"
require "curriculum"

set :public, "web"

get '/' do
  Home.new.to_pretty
end

get '/about' do
  About.new.to_pretty
end

get '/learn_ruby' do
  Curriculum.new(:name => "learn_ruby").to_pretty
end
