class CreateDivisions < ActiveRecord::Migration[7.1]
  def change
    create_table :divisions do |t|
      t.string :name
      t.references :championship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
