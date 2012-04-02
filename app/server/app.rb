require 'sinatra'

get "/" do
  if params[:code]
    Code.new(params[:code]).run.to_json
  else
    "<form><input name='code'></form>"
  end
end
