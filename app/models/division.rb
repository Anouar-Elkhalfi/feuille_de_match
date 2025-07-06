class Division < ApplicationRecord
  belongs_to :championship
  has_many :matches, dependent: :destroy
end
