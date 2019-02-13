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
  user.battle2(user_party, opp_party)
end
