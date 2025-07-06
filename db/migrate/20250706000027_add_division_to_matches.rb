class AddDivisionToMatches < ActiveRecord::Migration[7.1]
  def change
    add_reference :matches, :division, foreign_key: true
  end
end
