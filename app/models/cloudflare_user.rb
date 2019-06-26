class CloudflareUser < ApplicationRecord
  belongs_to :user
  has_many :cloudflare_domains, dependent: :nullify

  validates :email, :api_key, presence: true, uniqueness: { case_sensitive: false }
end
