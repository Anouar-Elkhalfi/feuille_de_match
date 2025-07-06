class Championship < ApplicationRecord
  belongs_to :season
  has_many :divisions, dependent: :destroy
end
