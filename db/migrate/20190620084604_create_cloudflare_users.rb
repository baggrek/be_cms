class CreateCloudflareUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :cloudflare_users do |t|
      t.string :email
      t.string :api_key

      t.timestamps
    end
  end
end
