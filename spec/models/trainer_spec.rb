require 'rails_helper'

RSpec.describe Trainer, type: :model do
  it { is_expected.to have_and_belong_to_many(:card_packs) }
  it { is_expected.to have_and_belong_to_many(:cards) }
end
