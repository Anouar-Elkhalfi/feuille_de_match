# app/models/match.rb
class Match < ApplicationRecord
  belongs_to :home_club, class_name: "Club"
  belongs_to :away_club, class_name: "Club"
  belongs_to :referee
  belongs_to :division
  has_one :championship, through: :division

  has_many :match_participations, dependent: :destroy
  has_many :players, through: :match_participations
end
