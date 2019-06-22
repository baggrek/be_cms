class CreateCloudflareDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :cloudflare_domains do |t|
      t.string :domain
      t.string :zone_id
      t.references :cloudflare_user, foreign_key: true

      t.timestamps
    end
  end
end
