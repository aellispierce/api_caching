class AddProfileTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :body
      t.string :username
      t.string :location
      t.string :avatar_url
      t.string :company_name
      t.integer :number_of_followers
      t.integer :number_following

      t.timestamps null: false
  end
    add_index :profiles, :username, unique: true
  end
end
