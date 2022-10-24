class Praesidium < ApplicationRecord
  belongs_to :curia

  validates :name, presence: true
  validates :parish, presence: true
  validates :date_created, presence: true

  validates_associated :curia
end
