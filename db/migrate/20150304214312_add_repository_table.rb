class AddRepositoryTable < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.integer :number_of_forks
      t.integer :number_of_stars
      t.datetime :profile_updated_at
      t.string :language
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
