class CreateReferees < ActiveRecord::Migration[7.1]
  def change
    create_table :referees do |t|
      t.string :first_name
      t.string :last_name
      t.string :license_number

      t.timestamps
    end
  end
end
