FactoryBot.define do
  factory :card_set do
    card_serie

    unique_id { "MyString" }
    name { "MyString" }
    logo_url { "MyString" }
    symbol_url { "MyString" }
    release_date { "2023-02-09" }
    first_edition_cards { 1 }
    holo_cards { 1 }
    normal_cards { 1 }
    official_cards { 1 }
    reverse_cards { 1 }
    total_cards { 1 }
  end
end
