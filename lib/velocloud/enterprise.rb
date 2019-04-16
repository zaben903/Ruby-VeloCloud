# frozen_string_literal: true

module VeloCloud
  class Enterprise
    include ActiveAttr::Model

    attribute :id, type: Integer
    attribute :created, type: String
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
    attribute :modified, type: String
    # Enterprise::Proxy
    attribute :enterprise_proxy, Object
  end
end