# frozen_string_literal: true

module VeloCloud
  class Edge
    class Configuration
      include ActiveAttr::Model

      attribute :created, type: DateTime
      attribute :description, type: String
      attribute :edge_count, type: Integer
      attribute :effective, type: String
      attribute :id, type: Integer
      attribute :modified, type: DateTime
      attribute :name, type: String
      attribute :version, type: String
      # Array[VeloCloud::Edge::Configuration::Module]
      attribute :modules, default: []

      def modules=(modules)
        if modules.is_a? Array
          if modules.first.is_a? Hash
            super modules.collect {|m| VeloCloud::Edge::Configuration::Module.new(m)}
          elsif modules.first.is_a? VeloCloud::Edge::Configuration::Module
            super modules
          else
            raise ArgumentError.new 'Expected an Array[Hash], Array[VeloCloud::Edge::Configuration::Module], Hash or VeloCloud::Edge::Configuration::Module'
          end
        elsif modules.is_a? Hash
          super [VeloCloud::Edge::Configuration::Module.new(modules)]
        elsif modules.is_a? VeloCloud::Edge::Configuration::Module
          super [modules]
        else
          raise ArgumentError.new 'Expected an Array[Hash], Array[VeloCloud::Edge::Configuration::Module], Hash or VeloCloud::Edge::Configuration::Module'
        end
      end
    end
  end
end