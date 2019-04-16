# frozen_string_literal: true

module VeloCloud
  class Edge
    class Configuration
      include ActiveAttr::Model

      attribute :created, type: String
      attribute :description, type: String
      attribute :edge_count, type: Integer
      attribute :effective, type: String
      attribute :id, type: Integer
      attribute :modified, type: String
      attribute :name, type: String
      attribute :version, type: String
      # Array[Edge::Configuration::Module]
      attribute :modules, default: []
    end
  end
end