class Duty < ApplicationRecord
  belongs_to :supervisor
  validates :date, uniqueness: true
end
