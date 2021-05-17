# frozen_string_literal: true

module VeloCloud
  class Edge
    class Configuration
      class DeviceSettings
        class Lan
          class Network
            include ActiveAttr::Model

            attribute :vlan_id, type: Integer
            attribute :name, type: String
            attribute :segment_id, type: Integer
            attribute :disabled, type: Boolean
            attribute :advertise, type: Boolean
            attribute :cost, type: Integer
            attribute :cidr_ip, type: String
            attribute :cidr_prefix, type: Integer
            attribute :netmask, type: String
            attribute :dhcp # Hash
            attribute :static_reserved, type: Integer
            attribute :base_dhcp_addr, type: Integer
            attribute :num_dhcp_addr, type: Integer
            attribute :multicast # Hash
            attribute :ospf # Hash
            attribute :override, type: Boolean
            attribute :interfaces # Array
          end
        end
      end
    end
  end
end