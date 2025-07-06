class CreateMatchParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :match_participations do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.boolean :captain

      t.timestamps
    end
  end
end
