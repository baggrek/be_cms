class CloudflareDomainDetail < ApplicationRecord
  require 'net/http'
  require 'uri'

  belongs_to :cloudflare_domain
  validates :sub_domain, :type_record, :pointing, presence: true

  enum type_record: {"A" => 1, "AAAA" => 2, "CNAME" => 3, "MX" => 4, "NS" => 5}

  def self.get_all_data(user_id, domain_id)
    row_sql = CloudflareDomainDetail.find_by_sql("
      SELECT 
        cloudflare_domain_details.id, sub_domain, pointing, type_record, cloudflare_domain_id, cloudflare_domains.domain, cloudflare_users.email
      FROM 
        cloudflare_domain_details 
      INNER JOIN cloudflare_domains ON cloudflare_domains.id = cloudflare_domain_details.cloudflare_domain_id 
      INNER JOIN cloudflare_users ON cloudflare_users.id = cloudflare_domains.cloudflare_user_id
      WHERE cloudflare_users.id = #{user_id} AND cloudflare_domains.id = #{domain_id}
      ")
  end

  def self.create_to_cloudflare(id_sub)
    row_data = CloudflareDomainDetail.joins(cloudflare_domain: :cloudflare_user).select("cloudflare_domain_details.id, sub_domain, pointing, type_record, cloudflare_domains.zone_id, cloudflare_domains.domain, cloudflare_users.api_key, cloudflare_users.email").find_by!(id: id_sub)

    uri = URI.parse("https://api.cloudflare.com/client/v4/zones/fb54c8b2e206db63eb777247f14791d9/dns_records")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)
    req['Content-Type'] = "application/json"
    req['X-Auth-Email'] = "#{row_data[:email]}"
    req['X-Auth-Key'] = "#{row_data[:api_key]}"
    # req['charset'] = 'UTF-8'
    req.body = {
        "type": "#{row_data[:type_record]}",
        "name": "#{row_data[:sub_domain]}.#{row_data[:domain]}",
        "content": "#{row_data[:pointing]}",
        
        "ttl": 120,
        "proxied": false
      }.to_json
    res = https.request(req)
  end
end
