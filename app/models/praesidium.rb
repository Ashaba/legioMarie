class Praesidium < ApplicationRecord
  belongs_to :curia, counter_cache: true
  has_many :members

  validates :name, presence: true
  validates :parish, presence: true
  validates :date_created, presence: true

  validates_associated :curia
end
