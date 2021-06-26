require "kemal"
require "./helpers"

oauth = Authcord.new(
    id: ENV["CLIENT_ID"],
    secret: ENV["CLIENT_SECRET"],
    redirect: ENV["REDIRECT_URI"]
) 


get "/" do |env|
    env.redirect oauth.authorize(["identify", "guilds"])
end


get "/callback" do |env|
    code = env.params.query["code"]
    token = oauth.authenticate(code)

    client = oauth.create_client()

    p client.get(
        "/api/v8/users/@me",
        HTTP::Headers{"Authorization" => token}
    ).body.to_s
end


Kemal.run