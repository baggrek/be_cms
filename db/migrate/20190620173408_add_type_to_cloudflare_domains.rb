class AddTypeToCloudflareDomains < ActiveRecord::Migration[5.2]
  def change
    add_column :cloudflare_domain_details, :type_record, :integer
  end
end
