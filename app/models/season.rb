class Season < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
