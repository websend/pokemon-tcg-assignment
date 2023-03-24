FactoryBot.define do
  factory :card do
    card_set

    unique_id { "MyString" }
    category { "MyString" }
    description { "MyString" }
    dex_id { "MyString" }
    effect { "MyText" }
    energy_type { "MyString" }
    evolve_from { "MyString" }
    hp { 1.5 }
    illustrator { "MyString" }
    image_url { "MyString" }
    level { 1 }
    local_id { 1 }
    name { "MyString" }
    rarity { "MyString" }
    regulation_mark { "MyString" }
    retreat { 1.5 }
    stage { "MyString" }
    suffix { "MyString" }
    trainer_type { "MyString" }
    first_edition { false }
    holo { false }
    normal { false }
    reverse { false }
    w_promo { false }
    updated_at { "2023-02-09 10:27:16" }
  end
end
