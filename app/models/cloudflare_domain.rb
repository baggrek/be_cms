class CloudflareDomain < ApplicationRecord
  has_many :cloudflare_domain_details, dependent: :destroy
  belongs_to :cloudflare_user

  validates :domain, :zone_id, presence: true, uniqueness: { case_sensitive: false }

  def self.get_all_data
    # cloudflare_user_id = self.cloudflare_user.email
    data = CloudflareDomain.joins(:cloudflare_user).order(id: :asc).select("cloudflare_domains.id, domain, zone_id, cloudflare_user_id, cloudflare_users.email as email_user")
  end

end
