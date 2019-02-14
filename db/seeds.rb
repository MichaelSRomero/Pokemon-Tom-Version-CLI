require_all 'app'

# Loads 1st Gen Pokemon (Kanto)
def load_pokemon
  i = 1

  until i == 151 do
    # dex_entry = rand(807)
    system "clear"
    puts "Loading #{i}/150 Pokemon"
    pokemon = fetch_api(i)
    name = pokemon["name"]
    base_exp = pokemon["base_experience"]
    type_one = pokemon["types"].find { |type| type["slot"] == 1 }["type"]["name"]

    Pkmn.create(
      name: name,
      element: type_one,
      base_experience: base_exp,
      pokedex: i
    )

    i += 1
  end
end

load_pokemon
