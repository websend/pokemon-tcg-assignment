class CardSet < ApplicationRecord
  belongs_to :card_serie

  scope :with_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :with_release_date_from, ->(release_date_from) {
    where(release_date: release_date_from.to_date..Date.current) if release_date_from.present?
  }
  scope :with_release_date_to, ->(release_date_to) {
    where(release_date: 50.years.ago.to_date..release_date_to.to_date) if release_date_to.present?
  }
end
