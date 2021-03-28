class GeoIpApi
  @@client = MaxMind::GeoIP2::Client.new(
    account_id: ENV['GEO_IP_ID'],
    license_key: ENV['GEO_IP_KEY'],
    host: 'geolite.info'
  )

  def self.determine(ip)
    @@client.country(ip).country.name
  end
end
