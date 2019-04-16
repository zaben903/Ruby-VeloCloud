# frozen_string_literal: true

module VeloCloud
  class Edge
    class Site
      include ActiveAttr::Model

      attribute :city, type: String
      attribute :contact_email, type: String
      attribute :contact_mobile, type: String
      attribute :contact_name, type: String
      attribute :contact_phone, type: String
      attribute :country, type: String
      attribute :lat, type: BigDecimal
      attribute :lon, type: BigDecimal
      attribute :name, type: String
      attribute :postal_code, type: String
      attribute :state, type: String
      attribute :street_address, type: String
      attribute :street_address2, type: String
    end
  end
end