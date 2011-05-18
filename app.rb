# This is a simple Sinatra app that drives testfirst.org on Heroku
here = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'erector'

$: << "#{here}/web"
require "page"
require "home"
require "about"
require "learn_ruby"
require "learn_javascript"

set :public, "web"

configure do
  mime_type :rb, 'text/plain'
end

get '/' do
  Home.new.to_pretty
end

get '/about' do
  About.new.to_pretty
end

get '/learn_ruby' do
  LearnRuby.new.to_pretty
end

get '/learn_javascript' do
  LearnJavaScript.new.to_pretty
end

get '/download/:file' do
  send_file("#{here}/download/#{params[:file]}", :disposition => 'attachment', :filename => params[:file])
end
