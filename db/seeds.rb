require_all 'app'
# To load 1st Gen Pokemon (Kanto) 1 - 151
# To load 2nd Gen Pokemon (Johto) 152 - 251
# To load 3rd Gen Pokemon (Hoenn) 252 - 386
# To load 4th Gen Pokemon (Sinnoh) 387 - 493
# To load 5th Gen Pokemon (Unova) 494 - 649
# To load 6th Gen Pokemon (Kalos) 650 - 721
# To load 7th Gen Pokemon (Alola) 722 - 807

def load_pokemon
  dex_entry = 1

  until dex_entry == 151 do
    system "clear"
    puts "Loading #{dex_entry}/150 Pokemon"
    pokemon = fetch_api(dex_entry)
    name = pokemon["name"]
    base_exp = pokemon["base_experience"]
    type_one = pokemon["types"].find { |type| type["slot"] == 1 }["type"]["name"]

    Pkmn.create(
      name: name,
      element: type_one,
      base_experience: base_exp,
      pokedex: dex_entry
    )

    dex_entry += 1
  end
end

load_pokemon
