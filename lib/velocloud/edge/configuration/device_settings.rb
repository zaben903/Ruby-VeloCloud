# frozen_string_literal: true

module VeloCloud
  class Edge
    class Configuration
      class DeviceSettings
        include ActiveAttr::Model

        attribute :id
        # Enum: "ENTERPRISE", "OPERATOR", "GATEWAY"
        attribute :type, type: String
        attribute :lan
        attribute :segments
        attribute :ha
        attribute :routed_interfaces
        attribute :software_update
        attribute :radio_settings
        attribute :ntp
        attribute :snmp
        attribute :multi_source_qos

        def data=(data)
          self.lan = VeloCloud::Edge::Configuration::DeviceSettings::Lan.new data[:lan]
          self.segments = data[:segments]
          self.ha = data[:ha]
          self.routed_interfaces = data[:routed_interfaces]
          self.software_update = data[:software_update]
          self.radio_settings = data[:radio_settings]
          self.ntp = data[:ntp]
          self.snmp = data[:snmp]
          self.multi_source_qos = data[:multi_source_qos]
        end

        def update!
          VeloCloud::Query.request '/configuration/updateConfigurationModule',
                                   id: id,
                                   _update: {
                                     data: {
                                       lan: self.lan,
                                       segments: self.segments,
                                       ha: self.ha,
                                       routed_interface: self.routed_interfaces,
                                       software_update: self.software_update,
                                       radio_settings: self.radio_settings,
                                       ntp: self.ntp,
                                       snmp: self.snmp,
                                       multi_source_qos: self.multi_source_qos
                                     }
                                   }
        end
      end
    end
  end
end