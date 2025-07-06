class CreateRedCards < ActiveRecord::Migration[7.1]
  def change
    create_table :red_cards do |t|
      t.references :match_participation, null: false, foreign_key: true
      t.string :reason

      t.timestamps
    end
  end
end
