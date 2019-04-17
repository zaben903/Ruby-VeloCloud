# frozen_string_literal: true

module VeloCloud
  class Edge
    class Link
      include ActiveAttr::Model

      attribute :id, type: Integer
      attribute :created, type: DateTime
      attribute :edge_id, type: Integer
      attribute :logical_id, type: String
      attribute :internal_id, type: String
      attribute :interface, type: String
      attribute :mac_address, type: String
      attribute :ip_address, type: String
      attribute :netmask, type: String
      # Enum: "UNKOWN", "WAN", "LAN"
      attribute :network_side, type: String
      # Enum: "UNKNOWN", "WIRELESS", "ETHERNET", "WIFI"
      attribute :network_type, type: String
      attribute :display_name, type: String
      attribute :isp, type: String
      attribute :org, type: String
      attribute :lat, type: BigDecimal
      attribute :lon, type: BigDecimal
      attribute :lastActive, type: String
      # Enum: "UNKNOWN", "STABLE", "UNSTABLE", "DISCONNECTED", "QUIET", "INITIAL", "STANDBY"
      attribute :state, type: String
      # Enum: "UNCONFIGURED", "STANDBY", "ACTIVE"
      attribute :backupState, type: String
      # Enum: "UNKNOWN", "STABLE", "UNSTABLE", "DEAD", "STANDBY"
      attribute :vpnState, type: String
      attribute :last_Event, type: String
      # Enum: "UNKNOWN", "STABLE", "UNSTABLE", "DISCONNECTED", "QUIET", "INITIAL", "STANDBY"
      attribute :last_event_state, type: String
      attribute :alerts_enabled, type: Integer
      attribute :operator_alerts_enabled, type: Integer
      # Enum: "IN_SERVICE", "OUT_OF_SERVICE", "HISTORICAL"
      attribute :service_state, type: String
      attribute :modified, type: DateTime
      attribute :service_groups, default: []
    end
  end
end