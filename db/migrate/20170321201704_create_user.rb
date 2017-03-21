class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :uid
      t.string :token
      t.string :provider

      t.timestamps null: false
    end
  end
end
