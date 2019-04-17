# frozen_string_literal: true

module VeloCloud
  class Edge
    include ActiveAttr::Model

    attribute :activation_key, type: String
    attribute :activation_key_expires, type: DateTime
    # Enum: "UNASSIGNED", "PENDING", "ACTIVATED", "REACTIVATION_PENDING"
    attribute :activation_state, type: String
    attribute :activation_time, type: DateTime
    attribute :alerts_enabled, type: Integer
    attribute :build_number, type: String
    attribute :created, type: DateTime
    attribute :description, type: String
    attribute :device_family, type: String
    attribute :device_id, type: String
    attribute :dns_name, type: String
    attribute :edge_hardware_id, type: String
    # Enum: "NEVER_ACTIVATED", "DEGRADED", "OFFLINE", "DISABLED", "EXPIRED", "CONNECTED"
    attribute :edge_state, type: String
    attribute :edge_state_time, type: DateTime
    # Enum: "CERTIFICATE_DISABLED", "CERTIFICATE_OPTIONAL", "CERTIFICATE_REQUIRED"
    attribute :endpoint_pki_mode, type: String
    attribute :enterprise_id, type: Integer
    attribute :ha_last_contact, type: String
    # Enum: "UNCONFIGURED", "PENDING_INIT", "PENDING_CONFIRMATION", "PENDING_CONFIRMED", "PENDING_DISSOCIATION", "READY", "FAILED"
    attribute :ha_previous_state, type: String
    attribute :ha_serial_number, type: String
    # Enum: "UNCONFIGURED", "PENDING_INIT", "PENDING_CONFIRMATION", "PENDING_CONFIRMED", "PENDING_DISSOCIATION", "READY", "FAILED"
    attribute :ha_state, type: String
    attribute :id, type: Integer
    attribute :is_live, type: Integer
    attribute :last_contact, type: DateTime
    attribute :logical_id, type: String
    # Enum: "edge500", "edge5X0", "edge510", "edge840", "edge1000", "edge1000qat", "virtual"
    attribute :model_number, type: String
    attribute :modified, type: DateTime
    attribute :name, type: String
    attribute :operator_alerts_enabled, type: Integer
    attribute :self_mac_address, type: String
    attribute :serial_mumber, type: String
    # Enum: "IN_SERVICE", "OUT_OF_SERVICE", "PENDING_SERVICE"
    attribute :service_state, type: String
    attribute :service_up_since, type: DateTime
    attribute :site_id, type: Integer
    attribute :software_updated, type: DateTime
    attribute :software_version, type: String
    attribute :system_up_since, type: DateTime
    # Edge::Configuration
    attribute :configuration, type: Object
    # Enterprise
    attribute :enterprise, type: Object
    # Edge::Link
    attribute :links, default: []
    # Edge::Link
    attribute :recent_links, default: []
    # Edge::Site
    attribute :site, type: Object

    def self.get(params = {})
      response = VeloCloud::Query.request('/edge/getEdge', params)
      edge = Edge.new response
      edge.configuration = Edge::Configuration.new response[:configuration] if response[:configuration]
      edge.enterprise = VeloCloud::Enterprise.new response[:enterprise] if response[:enterprise]
      if response[:links]
        edge.links = response[:links].collect do |link|
          Edge::Link.new(link)
        end
      end
      if response[:recent_links]
        edge.recent_links = response[:recent_links].collect do |link|
          Edge::Link.new(link)
        end
      end
      edge.site = Edge::Site.new response[:site] if response[:site]
      edge
    end
  end
end