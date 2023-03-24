class CardPack < ApplicationRecord
  scope :with_name, ->(name) do
    where("LOWER(name) LIKE :name", name: "%#{name.downcase}%") if name.present?
  end

  has_and_belongs_to_many :trainers
end
