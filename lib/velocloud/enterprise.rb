# frozen_string_literal: true

module VeloCloud
  class Enterprise
    include ActiveAttr::Model

    attribute :id, type: Integer
    attribute :created, type: DateTime
    attribute :network_id, type: Integer
    attribute :gateway_pool_id, type: Integer
    attribute :alerts_enabled, type: Boolean
    attribute :operator_alerts_enabled, type: Boolean
    # Enum: "CERTIFICATE_DISABLED", "CERTIFICATE_OPTIONAL", "CERTIFICATE_REQUIRED"
    attribute :endpoint_pki_mode, type: String
    attribute :name, type: String
    attribute :domain, type: String
    attribute :prefix, type: String
    attribute :logical_id, type: String
    attribute :account_number, type: String
    attribute :description, type: String
    attribute :contact_name, type: String
    attribute :contact_phone, type: String
    attribute :contact_mobile, type: String
    attribute :contact_email, type: String
    attribute :street_address, type: String
    attribute :street_address2, type: String
    attribute :city, type: String
    attribute :state, type: String
    attribute :postal_code, type: String
    attribute :country, type: String
    attribute :lat, type: BigDecimal
    attribute :lon, type: BigDecimal
    attribute :network_id, type: Integer
    attribute :timezone, type: String
    attribute :locale, type: String
    attribute :modified, type: DateTime
    # Enterprise::Proxy
    attribute :enterprise_proxy, type: Object

    def self.get(params = {})
      VeloCloud::Enterprise.new VeloCloud::Query.request('/enterprise/getEnterprise', params)
    end

    def get(params = {})
      params[:id] = id
      self.attributes = VeloCloud::Query.request('/edge/getEdge', params)
    end

    def edges(params = {})
      params[:enterpriseId] = id
      response = VeloCloud::Query.request('/enterprise/getEnterpriseEdges', params)
      edges = []
      response.each do |res|
        edges << VeloCloud::Edge.new(res)
      end
      edges
    end
  end
end