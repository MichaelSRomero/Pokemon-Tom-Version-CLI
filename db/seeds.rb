require_all 'app'

# fire_types = fetch_api("fire")
# water_types = fetch_api("water")
# grass_types = fetch_api("grass")
# random_pkmn = fetch_api(rand(807))

# Loads 20 random Pokemon of a type
def load_pokemon
  i = 0

  until i == 20 do
    pokemon = fetch_api(rand(807))
    name = pokemon["name"]
    base_exp = pokemon["base_experience"]
    type_one = pokemon["types"].find { |type| type["slot"] == 1 }["type"]["name"]
    
    Pkmn.create(name: name, element: type_one, base_experience: base_exp)
#     # random = rand(type["pokemon"].count)
#     # pkmn_name = type["pokemon"][random]["pokemon"]["name"]
#     # Pkmn.create(name: pkmn_name, element: type["name"])
#
    i += 1
  end
end

# load_pokemon(fire_types)
# load_pokemon(water_types)
# load_pokemon(grass_types)
load_pokemon
