class AddMatchMetadataToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :pre_match_claims, :text
    add_column :matches, :post_match_claims, :text
    add_column :matches, :report_submitted, :boolean
    add_column :matches, :home_signature, :boolean
    add_column :matches, :away_signature, :boolean
  end
end
