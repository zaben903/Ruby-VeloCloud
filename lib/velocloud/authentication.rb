# frozen_string_literal: true

module VeloCloud
  class Authentication
    attr_accessor :cookie

    def initialize
      authenticate
    end

    def authenticate
      @cookie = VeloCloud::Query.authenticate
    end

    def cookie_string
      @cookie.to_cookie_string
    end

    def validate_cookie!
      if @cookie.empty?
        VeloCloud.authenticate
      end
    end
  end
end