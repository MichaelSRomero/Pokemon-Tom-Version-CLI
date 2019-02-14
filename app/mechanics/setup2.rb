require "pry"
def setup2(user)
  stop_music
  load_battle_music
  sleep(1)
  load_battle_animation
  system "clear"
  prompt = TTY::Prompt.new(active_color: :cyan)
  random = Pkmn.all.sample(12)

  random.map! { |pokemon| pokemon.name.capitalize  }

  prompt.say("Whoa! A horde of wild Pokemon appeared!")
  sleep(1)
  user_party = prompt.multi_select("Select 6 Pokemon for your party!", random, per_page: 12)
  opp_party = random - user_party
  user.battle2(user_party, opp_party, false)
end

def trainer_setup(user)
  stop_music
  load_trainer_battle_music
  prompt = TTY::Prompt.new(active_color: :cyan)

  user_pokemons = (UserPkmn.all.where user_id: user.id, captured: true).map { |pokemon| pokemon.pkmn.name.capitalize }

  opp = find_opp(user)

  opp_pokemons = (UserPkmn.all.where user_id: opp.id, captured: true).map { |pokemon| pokemon.pkmn.name.capitalize }
  opp_party = opp_pokemons.sample(6)

  user_party = prompt.multi_select("Select up to 6 of your captured Pokemons!", user_pokemons, per_page: 12)

  puts "#{opp.name} challenges you to a Pokemon battle!"
  sleep(1)
  user.battle2(user_party, opp_party, true)
end

def find_opp(user)
  user_info = user
  opp = User.all.sample
  if opp == user_info
    find_opp
  else
    return opp
  end
end
