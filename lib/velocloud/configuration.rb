# frozen_string_literal: true

module VeloCloud
  class Configuration
    attr_accessor :base_uri, :username, :password

    def initialize
      @base_uri = nil
      @username = nil
      @password = nil
    end

    def base_uri=(base_uri)
      @base_uri = "#{base_uri}/portal/rest"
      VeloCloud::Query.base_uri @base_uri
    end
  end
end