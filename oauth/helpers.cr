require "uri"
require "oauth2"
require "http/client"


class Authcord
    def initialize(id = "", secret = "", redirect = "")
        @id = id
        @secret = secret
        @redirect = redirect
        @cli = OAuth2::Client.new(
            "discord.com", id, secret, 
            redirect_uri: redirect,
            auth_scheme: :request_body
        )
    end

    def authorize(scopes : Array)
        return @cli.get_authorize_uri(scope: scopes.join(' '))
    end

    def authenticate(code : String)
        res = HTTP::Client.post(
            url: "https://discord.com/api/v8/oauth2/token",
            headers: HTTP::Headers{
                "Content-Type" => "application/x-www-form-urlencoded"
            },
            form: {
                "code" => code,
                "client_id" => @id,
                "client_secret" => @secret,
                "redirect_uri" => @redirect,
                "grant_type" => "authorization_code"
            }
        )

        return "Bearer #{JSON.parse(res.body).as_h["access_token"]}"
    end

    def create_client()
        return HTTP::Client.new(
            uri: URI.parse("https://discord.com"), tls: true
        )
    end
end
