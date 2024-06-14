class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.text :bio
      t.string :location
      t.date :birthday
      t.string :gender

      t.timestamps
    end
  end
end
