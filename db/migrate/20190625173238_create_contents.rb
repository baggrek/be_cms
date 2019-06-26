class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :url_image
      t.string :url_redirect
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
