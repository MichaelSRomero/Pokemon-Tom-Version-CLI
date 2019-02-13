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

def fetch_api(pokedex_num)
  # raw_response = RestClient.get("https://pokeapi.co/api/v2/type/#{type_name}/")
  raw_response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{pokedex_num}")
  json_response = JSON.parse(raw_response)
end
