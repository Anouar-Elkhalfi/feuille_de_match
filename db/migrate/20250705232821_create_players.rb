class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :license_number
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
