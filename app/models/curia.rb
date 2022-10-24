class Curia < ApplicationRecord
  has_many :praesidia

  validates :name, presence: true
  validates :location, presence: true
  validates :date_created, presence: true
end
