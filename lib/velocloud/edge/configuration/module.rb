# frozen_string_literal: true

module VeloCloud
  class Edge
    class Configuration
      class Module
        include ActiveAttr::Model

        attribute :id, type: Integer
        # Enum: "imageUpdate", "controlPlane", "managementPlane", "firewall", "QOS", "deviceSettings", "WAN", "metaData", "properties"
        attribute :name, type: String
        # Enum: "ENTERPRISE", "OPERATOR", "GATEWAY"
        attribute :type, type: String
        attribute :description, type: String
        attribute :configuration_id, type: Integer
        attribute :data
        attribute :refs
      end
    end
  end
end