class CreateInjuries < ActiveRecord::Migration[7.1]
  def change
    create_table :injuries do |t|
      t.references :match_participation, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
