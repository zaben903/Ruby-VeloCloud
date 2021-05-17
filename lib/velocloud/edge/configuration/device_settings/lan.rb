# frozen_string_literal: true

module VeloCloud
  class Edge
    class Configuration
      class DeviceSettings
        class Lan
          include ActiveAttr::Model

          attribute :interfaces
          attribute :networks
          attribute :visibility
          attribute :management

          def networks=(networks)
            if networks.class == Array
              super networks.collect { |network| VeloCloud::Edge::Configuration::DeviceSettings::Lan::Network.new network }
            elsif networks.class == Hash
              super [VeloCloud::Edge::Configuration::DeviceSettings::Lan::Network.new(networks)]
            elsif networks.class == VeloCloud::Edge::Configuration::DeviceSettings::Lan::Network
              super [networks]
            else
              raise ArgumentError.new 'Expected a Array[Hash], Array[VeloCloud::Edge::Configuration::DeviceSettings::Lan::Network], Hash, or VeloCloud::Edge::Configuration::DeviceSettings::Lan::Network'
            end
          end
        end
      end
    end
  end
end