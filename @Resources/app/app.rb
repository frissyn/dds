require "sinatra"
require "httparty"

$SELF = "http://localhost:9999"
$BASE = "https://dds.frissyn.repl.co/"

set :port, 9999
set :bind, "0.0.0.0"
set :protection, :except => :frame_options

get "/" do
    redirect $BASE
end

get "/relay" do
    acc = params["acc"]
    ref = params["ref"]

    File.open("../cache/tokens", "w+") do |f|
        f.write("#{acc}-#{ref}")
    end

    redirect "/settings"
end

get "/settings" do
    "work in progress"
end
