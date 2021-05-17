# frozen_string_literal: true

module VeloCloud
  class Query
    include HTTParty

    def base_uri(base_uri)
      base_uri base_uri
    end

    def self.authenticate
      response = post '/login/enterpriseLogin',
                      body: {
                        username: VeloCloud.configuration.username,
                        password: VeloCloud.configuration.password
                      }
      cookie = HTTParty::CookieHash.new
      response.headers.get_fields('Set-Cookie').each { |c| cookie.add_cookies(c) }
      # TODO: Raise error if sign in fails
      cookie
    end

    def self.logout
      response = post '/logout',
                           headers: { Cookie: VeloCloud.auth.cookie_string }
      if response.code != 200 || response.code != 302
        raise RequestFailed.new(response.code, '')
      end

      true
    end

    def self.request(url, body = {})
      VeloCloud.auth.validate_cookie!

      response = post url,
                      headers: { Cookie: VeloCloud.auth.cookie_string },
                      body: body.to_json

      body = JSON.parse(response.body, symbolize_names: true).to_snake_keys
      if (body.is_a?(Hash) && body[:error].present?) || !(response.code >= 200 && response.code < 400)
        raise RequestFailed.new(body[:error][:code], body[:error][:message])
      end

      body
    end
  end
end