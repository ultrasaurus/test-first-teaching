require 'sinatra'

get "/" do
  if params[:cmd]
    begin
      $SAFE = 3
      cmd = params[:cmd]
      result = eval("$SAFE = 3;#{cmd}")
      return "<pre>#{result}</pre>"
    rescue Exception => e
      p e
      return "<pre>#{e.class}: #{e.message}</pre>"
    ensure
      $SAFE = 0
    end
  else
    "<form><input name='cmd'></form>"
  end
end
