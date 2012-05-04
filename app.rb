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
  p params
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
get "/live/:curriculum/:lab" do
  lab_dir = "#{here}/#{params[:curriculum]}/#{params[:lab]}"
  puts lab_dir
  Live.new(
    :test => "#{lab_dir}/#{params[:lab]}_spec.rb",
    :notes => ("#{lab_dir}/index.md" if File.exist? "#{lab_dir}/index.md")
  ).to_pretty
end

get "/live" do
  Live.new(
    :test => "#{here}/learn_ruby/hello/hello_spec.rb",
    :notes => "#{here}/learn_ruby/hello/index.md"
  ).to_pretty
end

