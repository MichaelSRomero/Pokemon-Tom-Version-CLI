require "pry"
def battle_mech(user_type, opp_type)
  type_rules = {
    bug: ["grass", "dark", "psychic"],
    dark: ["ghost", "psychic"],
    dragon: ["fire", "water", "grass", "electric"],
    electric: ["flying", "water"],
    fairy: ["dark", "dragon", "fighting"],
    fighting: ["dark", "ice", "normal", "rock", "steel"],
    fire: ["bug", "grass", "ice", "steel"],
    flying: ["bug", "fighting", "grass"],
    ghost: ["fighting" , "psychic"],
    grass: ["ground", "rock", "water"],
    ground: ["electric", "fire", "poison", "rock", "steel"],
    ice: ["dragon", "flying", "grass", "ground"],
    normal: ["ghost"],
    poison: ["fairy", "grass"],
    psychic: ["fighting", "poison"],
    rock: ["bug", "fire", "flying", "ice"],
    steel: ["fairy", "ice", "rock"],
    water: ["fire", "ground", "rock"],
  }
  if type_rules[opp_type.to_sym].include?(user_type)
    return "loss"
  elsif type_rules[user_type.to_sym].include?(opp_type)
    return "win"
  else
    return "draw"
  end
end
