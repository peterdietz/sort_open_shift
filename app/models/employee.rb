class Employee < ApplicationRecord
  belongs_to :organization
  has_many :scores
end
