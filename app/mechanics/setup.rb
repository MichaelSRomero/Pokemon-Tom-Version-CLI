############################################
## ---------- SETUP METHODS --------------##
############################################

def battle_setup(user)
  stop_music
  load_battle_music
  sleep(1)
  load_battle_animation
  system "clear"
  random = Pkmn.all.sample(12)

  random.map! { |pokemon| pokemon.name.capitalize  }

  text_anim("Whoa! A horde of wild Pokemon appeared!")
  sleep(1)

  until false
    user_party = prompt.multi_select("Select 6 Pokemon for your party!", random, per_page: 12)
    break if user_party.length == 6
  end

  opp_party = random - user_party
  user.battle(user_party, opp_party, false)
end

def trainer_setup(user)
  stop_music
  load_trainer_battle_music

  # Searches if other trainers(users) exist or have PKMN caught,
  # if FALSE, then takes you back to User Menu
  if User.all.length == 1 || user.user_pkmns.count == 0
    text_anim("Currently there are no other trainers, bringing you back to the main menu!")
    sleep(1.5)
    display_user_menu(user)
  else
    user_pokemons = (UserPkmn.all.where user_id: user.id, captured: true).where("fatigue < ?", 2)
    opp = find_opp(user)
    opp_pokemons = (UserPkmn.all.where user_id: opp.id, captured: true).where("fatigue < ?", 2)

    # Checks both User and Trainer fatigue,
    # if either or are fatigue then cancels battle and reduces fatigue level
    if user_pokemons == []
      text_anim("All of your Pokemons are too tired to battle!")
      text_anim("Please check back soon!")
      min_fatigue(UserPkmn.all.where user_id: user.id)
      sleep(1.5)
    elsif opp_pokemons == []
      text_anim("All of your opponent's Pokemons are too tired to battle!")
      text_anim("Please check back for another oppoenent!")
      min_fatigue(UserPkmn.all.where user_id: opp.id)
      min_fatigue(UserPkmn.all.where user_id: user.id)
      sleep(1.5)
    else
      user_pokemon_list = user_pokemons.map { |pokemon| pokemon.pkmn.name.capitalize }
      opp_pokemon_list = opp_pokemons.map { |pokemon| pokemon.pkmn.name.capitalize }
      opp_party = opp_pokemon_list.sample(6)

      until false
        user_party = prompt.multi_select("Select up to 6 of your captured non-fatigued Pokemons!", user_pokemon_list, per_page: 12)
        break if user_party.length <= 6
      end

      # User fatigue mechanic
      user_hash1 = {}
      user_hash1[:name] = user_party.map(&:downcase)
      user_arr = (Pkmn.all.where(user_hash1)).map{|pokemon| pokemon.id}
      user_hash2 = {}
      user_hash2[:pkmn_id] = user_arr

      user_c = user_pokemons.where(user_hash2)
      user_nc = user_pokemons.where.not(user_hash2)

      # Opponent fatigue mechanic
      opp_hash1 = {}
      opp_hash1[:name] = opp_party.map(&:downcase)
      opp_arr = (Pkmn.all.where(opp_hash1)).map{|pokemon| pokemon.id}
      opp_hash2 = {}
      opp_hash2[:pkmn_id] = opp_arr

      opp_c = opp_pokemons.where(opp_hash2)
      opp_nc = opp_pokemons.where.not(opp_hash2)

      add_fatigue(user_c)
      add_fatigue(opp_c)
      min_fatigue(user_nc)
      min_fatigue(opp_nc)

      text_anim("#{opp.name} challenges you to a Pokemon battle!")
      sleep(1)
      user.battle(user_party, opp_party, true)
    end
  end
end

############################################
## ---------- HELPER METHODS -------------##
############################################

def add_fatigue(arr)
  arr.each do |row|
    row.fatigue += 1
    row.save
  end
end

def min_fatigue(not_chosen)
  not_chosen.each do |row|
    row.fatigue -= 1
    row.save
  end
end

def find_opp(user)
  opp = User.all.sample
  if opp == user
    find_opp(user)
  else
    return opp
  end
end
