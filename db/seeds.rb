require_all 'app'

fire_types = fetch_api("fire")
water_types = fetch_api("water")
grass_types = fetch_api("grass")

# Loads 20 random Pokemon of a type
def load_pokemon(type)
  i = 0

  until i == 20 do
    random = rand(type["pokemon"].count)

    pkmn_name = type["pokemon"][random]["pokemon"]["name"]
    Pkmn.create(name: pkmn_name, element: type["name"])

    i += 1
  end
end

load_pokemon(fire_types)
load_pokemon(water_types)
load_pokemon(grass_types)
