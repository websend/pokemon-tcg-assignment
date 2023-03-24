class Card < ApplicationRecord
  belongs_to :card_set

  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :attacks
  has_and_belongs_to_many :pokemon_types
  has_and_belongs_to_many :resistances
  has_and_belongs_to_many :weaknesses
  has_and_belongs_to_many :trainers

  scope :with_card_set_id, ->(card_set_id) { where(card_set_id: card_set_id) if card_set_id.present? }
  scope :with_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :with_rarity, ->(rarity) { where(rarity: rarity) if rarity.present? }
  scope :with_image, -> { where.not(image_url: nil) }
  scope :with_owned_by, ->(trainer_id) { where(id: Card.joins(:trainers).where(trainers: { id: trainer_id })) if trainer_id.present? }
end
