class Praesidium < ApplicationRecord
  belongs_to :curia, counter_cache: true

  validates :name, presence: true
  validates :parish, presence: true
  validates :date_created, presence: true

  validates_associated :curia
end
