class CreateChampionships < ActiveRecord::Migration[7.1]
  def change
    create_table :championships do |t|
      t.string :name
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
