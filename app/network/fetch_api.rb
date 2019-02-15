require 'rest-client'
require 'json'

def fetch_api(pokedex_num)
  raw_response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{pokedex_num}")
  json_response = JSON.parse(raw_response)
end
