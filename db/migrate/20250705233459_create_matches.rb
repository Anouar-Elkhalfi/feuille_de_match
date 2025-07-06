class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :kickoff_time
      t.string :stadium
      t.integer :home_score
      t.integer :away_score
      t.references :home_club, null: false, foreign_key: { to_table: :clubs }
      t.references :away_club, null: false, foreign_key: { to_table: :clubs }
      t.references :referee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
