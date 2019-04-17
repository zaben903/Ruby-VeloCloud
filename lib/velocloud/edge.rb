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
    attribute :configuration
    # Enterprise
    attribute :enterprise
    # Edge::Link
    attribute :links, default: []
    # Edge::Link
    attribute :recent_links, default: []
    # Edge::Site
    attribute :site

    def configuration=(configuration)
      if configuration.is_a? Hash
        super VeloCloud::Edge::Configuration.new configuration
      elsif configuration.is_a? VeloCloud::Edge::Configuration
        super configuration
      else
        raise ArgumentError.new 'Expected a Hash or a VeloCloud::Edge::Configuration'
      end
    end

    def enterprise=(enterprise)
      if enterprise.is_a? Hash
        super VeloCloud::Enterprise.new enterprise
      elsif enterprise.is_a? VeloCloud::Enterprise
        super enterprise
      else
        raise ArgumentError.new 'Expected a Hash or a VeloCloud::Enterprise'
      end
    end

    def links=(links)
      super links_insert links
    end

    def recent_links=(recent_links)
      super links_insert recent_links
    end

    def site=(site)
      if site.is_a? Hash
        super VeloCloud::Edge::Site.new site
      elsif site.is_a? VeloCloud::Edge::Site
        super site
      else
        raise ArgumentError.new 'Expected a Hash or a VeloCloud::Edge::Site'
      end
    end

    def self.get(params = {})
      params[:with] = [:configuration, :enterprise, :links, :recent_links, :site] if params[:with] == [:all]
      response = VeloCloud::Query.request('/edge/getEdge', params)
      VeloCloud::Edge.new response
    end

    private

    def links_insert(to_return)
      if to_return.is_a?(Array) && !to_return.empty?
        if to_return.first.is_a? Hash
          return to_return.collect {|link| VeloCloud::Edge::Link.new(link)}
        elsif to_return.first.is_a? VeloCloud::Edge::Link
          return to_return
        else
          raise ArgumentError.new 'Expected an Array[VeloCloud::Edge::Link] or VeloCloud::Edge::Link'
        end
      elsif to_return.is_a? VeloCloud::Edge::Link
        return [to_return]
      else
        raise ArgumentError.new 'Expected an Array[VeloCloud::Edge::Link] or VeloCloud::Edge::Link'
      end
    end
  end
end