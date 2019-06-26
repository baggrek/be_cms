class AddUserToCloudflareUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :cloudflare_users, :user, foreign_key: true
  end
end
