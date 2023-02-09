class CardSet < ApplicationRecord
  belongs_to :card_serie

  scope :with_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
end
