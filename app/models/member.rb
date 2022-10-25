class Member < ApplicationRecord
  belongs_to :praesidium, counter_cache: true

  VALID_MEMBERSHIP_TYPES = %w[active praetorian auxiliary adjutorian]
  validates :membership_type, inclusion: { in: VALID_MEMBERSHIP_TYPES }

  VALID_GENDER = %w[male female]
  validates :gender, inclusion: { in: VALID_GENDER }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true

  validates_associated :praesidium
end
