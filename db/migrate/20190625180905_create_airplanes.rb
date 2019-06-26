class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :airplane_code
      t.string :airline
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
