def setup2
  prompt = TTY::Prompt.new(active_color: :cyan)
  random = Pkmn.all.sample(12)

  random.map! { |pokemon| pokemon.name.capitalize  }

  user_party = prompt.multi_select("Select 6 Pokemons for your party!", random, per_page: 12)
  opp_party = random - user_party
  User.all[0].battle2(user_party, opp_party)
end
