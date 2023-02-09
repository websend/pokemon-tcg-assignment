class Attack < ApplicationRecord
  has_and_belongs_to_many :cards

  serialize :cost, Array
end
