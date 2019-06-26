class CreateContentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :content_details do |t|
      t.integer :click
      t.references :airplane, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
