class Curia < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :date_created, presence: true
end
