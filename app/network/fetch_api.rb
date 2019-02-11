require 'rest-client'
require 'json'
require 'pry'

# KEYS (TYPE) ----------- https://pokeapi.co/api/v2/type/#{type_name}/ Fire, Water, Grass
#   name | pokemon (arr)
#         POKEMON-KEYS: pokemon["pokemon"] (hash)
#                     KEYS: ["name"] | ["url"]


  # Might require argument name
def fetch_api
  # raw_response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{name}")
  raw_response = RestClient.get("https://pokeapi.co/api/v2/type/fire/")
  json_response = JSON.parse(raw_response)
  # https://pokeapi.co/api/v2/type/fire/
end

# binding.pry
