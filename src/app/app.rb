require 'sinatra'
require 'httparty'

$BASE = "https://discord-stickers.frissyn.repl.co/"

set :port, 9999
set :bind, '0.0.0.0'
set :protection, :except => :frame_options


get "/" do
    redirect $BASE
end

get "/relay" do
    acc = params["acc"]
    ref = params["ref"]
end