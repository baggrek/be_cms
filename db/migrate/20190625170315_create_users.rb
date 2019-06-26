class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :midle_name
      t.string :last_name
      t.integer :role, default: 2

      t.timestamps
    end
  end
end
