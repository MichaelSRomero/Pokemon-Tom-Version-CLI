require 'rest-client'
require 'json'

# KEYS (TYPE) ----------- https://pokeapi.co/api/v2/type/#{type_name}/ Fire, Water, Grass
#   name | pokemon (arr)
#         POKEMON-KEYS: pokemon["pokemon"] (hash)
#                     KEYS: ["name"] | ["url"]

# 20 of each type
# Water type count = 145
# Fire type count = 76
# Grass type count = 110

def fetch_api(type_name)
  raw_response = RestClient.get("https://pokeapi.co/api/v2/type/#{type_name}/")
  json_response = JSON.parse(raw_response)
end

fire_types = fetch_api("fire")
water_types = fetch_api("water")
grass_types = fetch_api("grass")

# --------------------------------
# i = 0
# until i == 20 do
#   pkmn_name = grass_types["pokemon"][i]["pokemon"]["name"]
#   Pkmn.create(name: pkmn_name, element: "grass")
#   i += 1
# end
