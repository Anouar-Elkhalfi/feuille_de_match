class MatchParticipation < ApplicationRecord
  belongs_to :match
  belongs_to :player

  has_many :yellow_cards, dependent: :destroy
  has_many :red_cards, dependent: :destroy
  has_many :injuries, dependent: :destroy
end
