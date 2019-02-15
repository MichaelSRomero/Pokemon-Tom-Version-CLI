############################################
## ---------- BATTLE METHODS -------------##
############################################

def type_rules
  {
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
    rock: ["bug", "fire", "flying", "ice", "electric"],
    steel: ["fairy", "ice", "rock"],
    water: ["fire", "ground", "rock"],
  }
end

def battle_conditions(user_type, opp_type)
  if type_rules[opp_type.to_sym].include?(user_type)
    return "loss"
  elsif type_rules[user_type.to_sym].include?(opp_type)
    return "win"
  else
    return "draw"
  end
end

############################################
## --------- CAPTURE METHODS -------------##
############################################

def yes_capture(pokemon, pokemon_stat)
  nickname = prompt.ask("Nickname your Pokemon:", default: pokemon.name.capitalize)
  if pokemon_stat == nil
    UserPkmn.create(nickname: nickname, win: 1, loss: 0, captured: true, user_id: self.id, pkmn_id: pokemon.id)
  else
    UserPkmn.update(pokemon_stat.id, nickname: nickname, captured: true)
    pokemon_stat.win += 1
    pokemon_stat.save
  end
end

def no_capture(pokemon, pokemon_stat)
  if pokemon_stat == nil
    UserPkmn.create(win: 1, loss: 0, user_id: self.id, pkmn_id: pokemon.id)
  else
    pokemon_stat.win += 1
    pokemon_stat.save
  end
end

############################################
## ----------- WIN METHODS ---------------##
############################################

def win_menu(user_pokemon, user_pokemon_stat)
  if user_pokemon_stat == nil || user_pokemon_stat.captured == false
    prompt.select("Catch this Pokemon?") do |menu|
      menu.choice "Yes", -> {yes_capture(user_pokemon, user_pokemon_stat)}
      menu.choice "No", -> {no_capture(user_pokemon, user_pokemon_stat)}
    end
  else
    win_trainer(user_pokemon, user_pokemon_stat)
  end
end

def win_trainer(user_pokemon, user_pokemon_stat)
  user_pokemon_stat.win += 1
  user_pokemon_stat.exp += 1
  user_pokemon_stat.save
  puts "#{user_pokemon.name.upcase} gained 1 EXP. Points!"
  sleep(0.75)
end

############################################
## ----------- LOSS METHODS --------------##
############################################

def loss_menu(user_pokemon, user_pokemon_stat)
  if user_pokemon_stat == nil
    UserPkmn.create(win: 0, loss: 1, user_id: self.id, pkmn_id: user_pokemon.id)
  else
    loss_trainer(user_pokemon_stat)
  end
end

def loss_trainer(user_pokemon_stat)
  user_pokemon_stat.loss += 1
  user_pokemon_stat.save
end
