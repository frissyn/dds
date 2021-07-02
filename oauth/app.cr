require "kemal"
require "./helpers"

oauth = Authcord.new(
    id: ENV["CLIENT_ID"],
    secret: ENV["CLIENT_SECRET"],
    redirect: ENV["REDIRECT_URI"]
)

relay = "https://localhost:9999/relay"


get "/" do |env|
    env.redirect oauth.authorize(["identify", "guilds"])
end


get "/callback" do |env|
    code = env.params.query["code"]
    token = oauth.authenticate(code)

    acc = oauth.data["access_token"]
    ref = oauth.data["refresh_token"]

    env.redirect "#{relay}?acc=#{acc}&ref=#{ref}"
end


Kemal.run