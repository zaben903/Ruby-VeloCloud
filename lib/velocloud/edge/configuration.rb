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
      # Array[Edge::Configuration::Module]
      attribute :modules, default: []

      def modules=(modules)
        a = []
        modules.each do |m|
          a << Configuration::Module.new(m)
        end
        a
      end
    end
  end
end