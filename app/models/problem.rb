class Problem < ApplicationRecord
  belongs_to :supervisor
  validates :computer, numericality: { only_integer: true }
end
