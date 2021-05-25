# frozen_string_literal: true

require 'happymapper'

module Ipgeobase
  class Metadata
    include HappyMapper

    tag 'query'

    element :country, String
    element :city, String
    element :countryCode, String
    element :lat, Float
    element :lon, Float
  end
end
