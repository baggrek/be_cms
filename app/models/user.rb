class User < ApplicationRecord
  has_many :cloudflare_users
  has_many :contents
  has_many :airplanes
  validates :username, uniqueness: {case_sensitive: false}
  validates :email, uniqueness:  true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  enum role: {"Admin" => 1, "User" => 2}
  has_secure_password

  def is_admin?
    role == "Admin"
  end
end
