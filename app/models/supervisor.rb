class Supervisor < ApplicationRecord
  has_many :duties
  has_many :problems
end
