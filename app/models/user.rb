class User < ActiveRecord::Base
  has_many :user_pkmns
  has_many :pkmns, through: :user_pkmns

  def battle2(user_party, opp_party)
    prompt = TTY::Prompt.new(active_color: :cyan)

    until user_party == [] || opp_party == []
      # variables.
      user_choice = prompt.select("Select a Pokemon to battle!", user_party)
      user_pokemon = (Pkmn.find_by name: user_choice.downcase)
      user_pokemon_stat = UserPkmn.find_by pkmn_id: user_pokemon.id, user_id: self.id
      opp_choice = opp_party.sample
      opp_pokemon = (Pkmn.find_by name: opp_choice.downcase)

      # finding user/opponent pokemon types.
      user_type = (Pkmn.find_by name: user_choice.downcase).element
      opp_type = (Pkmn.find_by name: opp_choice.downcase).element

      # pre-battle announcement.
      puts "I choose you #{user_choice}(#{user_type.capitalize})!"
      sleep(1.5)
      puts "Your opponent chooses #{opp_choice}(#{opp_type.capitalize})!"
      sleep(1.5)

      # if user lose.
      if battle_mech(user_type, opp_type) == "loss"
        puts "#{user_choice} was not effective against #{opp_choice}!"
        sleep (0.75)
        puts "#{user_choice} fainted."
        puts "You Lose!"

        loss_menu(user_pokemon, user_pokemon_stat)
        user_party.delete(user_choice)
      # if user win.
      elsif battle_mech(user_type, opp_type) == "win"
        puts "#{user_choice} was super effective against #{opp_choice}!"
        puts "Opponent's #{opp_choice} fainted."
        sleep (0.75)
        puts "You Win!"

        win_menu(user_pokemon, user_pokemon_stat)
        opp_party.delete(opp_choice)

      # if draw compare base_experience to declare winner.
      else
        if user_pokemon.base_experience > opp_pokemon.base_experience
          puts "Your #{user_choice} is more experienced than your opponent's #{opp_choice}!"
          puts "Opponent's #{opp_choice} fainted."
          sleep(0.75)
          puts "You Win!"

          win_menu(user_pokemon, user_pokemon_stat)
          opp_party.delete(opp_choice)
        elsif user_pokemon.base_experience < opp_pokemon.base_experience
          puts "Your #{user_choice} is less experienced than your opponent's #{opp_choice}!"
          puts "#{user_choice} fainted."
          sleep(0.75)
          puts "You Lose!"

          loss_menu(user_pokemon, user_pokemon_stat)
          user_party.delete(user_choice)
        else
          puts "#{user_choice} and #{opp_choice} are eqaully experienced!"
          puts "Both #{user_choice} and #{opp_choice} fainted!"
          sleep(0.75)
          puts "You Draw!"
          user_party.delete(user_choice)
          opp_party.delete(opp_choice)
        end
      end
      sleep(2)
      system "clear"
    end
  end
end

  # capture methods.
  def yes_capture2(pokemon, pokemon_stat)
    prompt = TTY::Prompt.new(active_color: :cyan)
    nickname = prompt.ask("Nickname your Pokemon:", default: pokemon.name.capitalize)
    if pokemon_stat == nil
      UserPkmn.create(nickname: nickname, win: 1, loss: 0, captured: true, user_id: self.id, pkmn_id: pokemon.id)
    else
      UserPkmn.update(pokemon_stat.id, nickname: nickname, captured: true)
      pokemon_stat.win += 1
      pokemon_stat.save
    end
  end

  def no_capture2(pokemon, pokemon_stat)
    if pokemon_stat == nil
      UserPkmn.create(win: 1, loss: 0, user_id: self.id, pkmn_id: pokemon.id)
    else
      pokemon_stat.win += 1
      pokemon_stat.save
    end
  end

  def win_menu(user_pokemon, user_pokemon_stat)
    prompt = TTY::Prompt.new(active_color: :cyan)
    if user_pokemon_stat == nil || user_pokemon_stat.captured == false
      prompt.select("Catch this Pokemon?") do |menu|
        menu.choice "Yes", -> {yes_capture2(user_pokemon, user_pokemon_stat)}
        menu.choice "No", -> {no_capture2(user_pokemon, user_pokemon_stat)}
      end
    else
      user_pokemon_stat.win += 1
      user_pokemon_stat.save
    end
  end

  def loss_menu(user_pokemon, user_pokemon_stat)
    prompt = TTY::Prompt.new(active_color: :cyan)
    if user_pokemon_stat == nil
      UserPkmn.create(win: 0, loss: 1, user_id: self.id, pkmn_id: user_pokemon.id)
    else
      user_pokemon_stat.loss += 1
      user_pokemon_stat.save
    end
  end
