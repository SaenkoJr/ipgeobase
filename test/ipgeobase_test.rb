# frozen_string_literal: true

require 'test_helper'

class IpgeobaseTest < Minitest::Test
  def setup
    stub_request(:get, 'http://ip-api.com/xml/8.8.8.8')
      .to_return(body: File.read('fixtures/response.xml'))
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_meta_data
    ip_meta = Ipgeobase.lookup('8.8.8.8')
    assert_equal ip_meta.country, 'United States'
    assert_equal ip_meta.city, 'Ashburn'
    assert_equal ip_meta.countryCode, 'US'
    assert_equal ip_meta.lat, 39.03
    assert_equal ip_meta.lon, -77.5
  end
end
