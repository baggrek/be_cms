class CreateCloudflareDomainDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cloudflare_domain_details do |t|
      t.string :sub_domain
      t.string :pointing
      t.references :cloudflare_domain, foreign_key: true

      t.timestamps
    end
  end
end
