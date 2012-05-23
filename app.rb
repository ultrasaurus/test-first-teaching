# This is a simple Sinatra app that drives testfirst.org on Heroku
here = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'erector'
require 'json'

$: << "#{here}/lib"
require "code"
require "rspec_code"

$: << "#{here}/web"
require "page"
require "home"
require "about"
require "learn_ruby"
require "learn_javascript"
require "live"
require "course"

set :public_folder, "web"

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

post "/run" do
  # p params
  if params[:code]
    if params[:rspec]
      RspecCode.new(params[:code], :rspec => params[:rspec]).run.to_json
    else
      Code.new(params[:code]).run.to_json
    end
  else
    "need code, was passed #{params.to_json}"
    # redirect "/live"
  end
end

# todo: test
get "/live/:course/:lab" do
  Live.new(
    :course => Course.new(params[:course]),
    :lab_name => params[:lab]
  ).to_pretty
end

get "/live" do
  Live.new(
    :course => Course.new("learn_ruby"),
    :lab_name => "hello"
  ).to_pretty
end

