class CardSerie < ApplicationRecord
  has_many :card_sets

  scope :with_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
end
