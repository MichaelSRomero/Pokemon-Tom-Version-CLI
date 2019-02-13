require "pry"
class User < ActiveRecord::Base
  has_many :user_pkmns
  has_many :pkmns, through: :user_pkmns

  def battle2(user_party, opp_party)
    prompt = TTY::Prompt.new(active_color: :cyan)

    until user_party == [] || opp_party == []
      # variables.
      user_choice = prompt.select("Select a Pokemon to battle!", user_party)
      user_pokemon = (Pkmn.find_by name: user_choice.downcase)
      opp_choice = opp_party.sample

      puts "Your opponent chooses #{opp_choice}!"

      # finding user/opponent pokemon types.
      user_type = (Pkmn.find_by name: user_choice.downcase).element
      opp_type = (Pkmn.find_by name: opp_choice.downcase).element
      sleep (1.5)

      # if user lose.
      if battle_mech(user_type, opp_type) == "loss"
        puts "#{user_choice} was not effective against #{opp_choice}!"
        sleep (0.75)
        puts "#{user_choice} fainted."
        puts "You lose!"
        if (UserPkmn.find_by pkmn_id: user_pokemon.id, user_id: self.id) == nil
          UserPkmn.create(win: 0, loss: 1, user_id: self.id, pkmn_id: user_pokemon.id)
        else
          pokemon_stat = UserPkmn.find_by pkmn_id: user_pokemon.id, user_id: self.id
          pokemon_stat.loss += 1
          pokemon_stat.save
        end
        user_party.delete(user_choice)
      # if user win.
      elsif battle_mech(user_type, opp_type) == "win"
        puts "#{user_choice} was super effective against #{opp_choice}!"
        puts "Opponent's #{opp_choice} fainted."
        sleep (0.75)
        puts "You Win!"
        if (UserPkmn.find_by pkmn_id: user_pokemon.id, user_id: self.id) == nil
          prompt.select("Catch this Pokemon?") do |menu|
            menu.choice "Yes", -> {yes_capture2(user_pokemon)}
            menu.choice "No", -> {no_capture2(user_pokemon)}
          end
        else
          pokemon_stat = UserPkmn.find_by pkmn_id: user_pokemon.id, user_id: self.id
          pokemon_stat.win += 1
          pokemon_stat.save
        end
        opp_party.delete(opp_choice)
      else
        puts "You Draw!"
      end
      sleep(2)
      system "clear"
    end
  end

  # capture methods.
  def yes_capture2(pokemon)
    prompt = TTY::Prompt.new(active_color: :cyan)
    nickname = prompt.ask("Nickname your Pokemon:", default: pokemon.name.capitalize)
    UserPkmn.create(nickname: nickname, win: 1, loss: 0, captured: true, user_id: self.id, pkmn_id: pokemon.id)
  end

  def no_capture2(pokemon)
    UserPkmn.create(win: 1, loss: 0, user_id: self.id, pkmn_id: pokemon.id)
  end

end
