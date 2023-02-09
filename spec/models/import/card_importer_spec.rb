require 'rails_helper'

module Import
  RSpec.describe CardImporter, type: :model do
    describe ".run" do
      let(:fake_result) do
        [
          {
            "abilities" => [
              {
                "effect" => "Once during your turn (before your attack), you may search your deck for another Unown and switch it with Unown. (Any cards attached to Unown, damage counters, Special Conditions, and effects on it are now on the new Pokémon.) If you do, put Unown on top of your deck. Shuffle your deck afterward. You can't use more than 1 Shuffle Poké-Power each turn.",
                "name" => "Shuffle",
                "type" => "Poke-POWER"
              }
            ],
            "attacks" => [
              {
                "cost" => ["Water", "Water"],
                "damage" => nil,
                "effect" => "Discard 1 Energy card to Starmie in order to use this attack. Remove all damage counters from Starmie.",
                "name" => "Recover"
              },
              {
                "cost" => ["Water", "Colorless", "Colorless"],
                "damage" => "20",
                "effect" => "Flip a coin. If heads, the Defending Pokémon is now Paralyzed.",
                "name" => "Star Freeze"
              }
            ],
            "category" => "Pokemon",
            "description" => "This Pokemon lives in the sea.",
            "dexId" => [121],
            "effect" => "Shuffle your hand into your deck. Then, draw 7 cards. You can't play any more Trainer cards this turn.",
            "energyType" => "Water",
            "evolveFrom" => "Staryu",
            "hp" => 60,
            "id" => "exu-!",
            "illustrator" => "Kyoko Koizumi",
            "image" => "https://assets.tcgdex.net/en/base/base4/94",
            "item" => nil,
            "level" => 1,
            "localId" => "!",
            "name" => "Unown",
            "rarity" => "Rare",
            "regulationMark" => "F",
            "resistances" => [{ "type" => "Fighting", "value" => "-30" }],
            "retreat" => 2,
            "set" => { "id" => "exu" },
            "stage" => "Basic",
            "suffix" => nil,
            "trainerType" => nil,
            "types" => ["Water"],
            "variants" => { "firstEdition" => false, "holo" => true, "normal" => true, "reverse" => true, "wPromo" => false },
            "weaknesses" => [{ "type" => "Psychic", "value" => "x2" }]
          }
        ]
      end

      before do
        allow(PokemonApi::Graphql::V2::Requests::Cards).
          to receive(:retrieve).
          and_return(fake_result)
      end

      let!(:card_set) { create(:card_set, unique_id: "exu") }

      before { described_class.run }

      it "retrieves Pokemon cards and stores cards and its associations in the database" do
        described_class.run

        expect(Card.count).to eql 1

        card = Card.first

        expect(card.abilities.count).to eql 1
        expect(card.attacks.count).to eql 2
        expect(card.pokemon_types.count).to eql 1
        expect(card.weaknesses.count).to eql 1
        expect(card.resistances.count).to eql 1
      end

      it "stores the correct card attributes" do
        expect(Card.first.attributes).to match(
          a_hash_including(
            "unique_id" => "exu-!",
            "category" => "Pokemon",
            "description" => "This Pokemon lives in the sea.",
            "dex_id" => 121,
            "effect" => "Shuffle your hand into your deck. Then, draw 7 cards. You can't play any more Trainer cards this turn.",
            "energy_type" => "Water",
            "evolve_from" => "Staryu",
            "hp" => 60,
            "illustrator" => "Kyoko Koizumi",
            "image_url" => "https://assets.tcgdex.net/en/base/base4/94",
            "level" => 1,
            "local_id" => "!",
            "name" => "Unown",
            "rarity" => "Rare",
            "regulation_mark" => "F",
            "retreat" => 2,
            "card_set_id" => card_set.id,
            "stage" => "Basic",
            "suffix" => nil,
            "trainer_type" => nil,
            "first_edition" => false,
            "holo" => true,
            "normal" => true,
            "reverse" => true,
            "w_promo" => false
          )
        )
      end

      it "stores the correct ability attributes" do
        attributes = Card.first.abilities.map(&:attributes)

        expect(attributes).to match_array(
          [
            a_hash_including(
              "effect" => "Once during your turn (before your attack), you may search your deck for another Unown and switch it with Unown. (Any cards attached to Unown, damage counters, Special Conditions, and effects on it are now on the new Pokémon.) If you do, put Unown on top of your deck. Shuffle your deck afterward. You can't use more than 1 Shuffle Poké-Power each turn.",
              "name" => "Shuffle",
              "ability_type" => "Poke-POWER"
            )
          ]
        )
      end

      it "stores the correct attack attributes" do
        attributes = Card.first.attacks.map(&:attributes)

        expect(attributes).to match_array(
          [
            a_hash_including(
              "cost" => ["Water", "Water"],
              "damage" => nil,
              "effect" => "Discard 1 Energy card to Starmie in order to use this attack. Remove all damage counters from Starmie.",
              "name" => "Recover"
            ),
            a_hash_including(
              "cost" => ["Water", "Colorless", "Colorless"],
              "damage" => "20",
              "effect" => "Flip a coin. If heads, the Defending Pokémon is now Paralyzed.",
              "name" => "Star Freeze"
            )
          ]
        )
      end

      it "stores the correct pokemon type attributes" do
        attributes = Card.first.pokemon_types.map(&:attributes)

        expect(attributes).to match_array(
          [
            a_hash_including("name" => "Water")
          ]
        )
      end

      it "stores the correct resistance attributes" do
        attributes = Card.first.resistances.map(&:attributes)

        expect(attributes).to match_array(
          [
            a_hash_including(
              "resistance_type" => "Fighting",
              "value" => "-30"
            )
          ]
        )
      end

      it "stores the correct weakness attributes" do
        attributes = Card.first.weaknesses.map(&:attributes)

        expect(attributes).to match_array(
          [
            a_hash_including(
              "weakness_type" => "Psychic",
              "value" => "x2"
            )
          ]
        )
      end
    end
  end
end
