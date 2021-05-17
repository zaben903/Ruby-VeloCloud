# frozen_string_literal: true

# External Gems
require 'httparty'
require 'active_attr'
require 'plissken'

# Support Libraries
require 'velocloud/version'
require 'velocloud/configuration'
require 'velocloud/authentication'
require 'velocloud/exceptions'
require 'velocloud/query'

# API Libraries
require 'velocloud/edge'
require 'velocloud/edge/configuration'
require 'velocloud/edge/configuration/module'
require 'velocloud/edge/configuration/device_settings'
require 'velocloud/edge/configuration/device_settings/lan'
require 'velocloud/edge/configuration/device_settings/lan/network'
require 'velocloud/edge/link'
require 'velocloud/edge/site'
require 'velocloud/enterprise'

module VeloCloud
  class << self
    attr_accessor :configuration
    attr_accessor :auth
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.authenticate
    self.auth ||= Authentication.new
  end

  def self.logout
    Query.logout
    self.auth = nil
  end
end
