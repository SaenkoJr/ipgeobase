# frozen_string_literal: true

require 'addressable/uri'
require 'net/http'

require_relative 'ipgeobase/version'

module Ipgeobase
  autoload :Metadata, 'ipgeobase/metadata'

  class Error < StandardError; end

  class << self
    def lookup(ip_address)
      url = Addressable::URI.parse("http://ip-api.com/xml/#{ip_address}")

      response = Net::HTTP.get(url)
      Metadata.parse response, single: true
    end
  end
end
