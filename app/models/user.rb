class User < ActiveRecord::Base
  has_many :user_pkmns
  has_many :pkmns, through: :user_pkmns

  def battle(user_party, opp_party, switch)
    until user_party == [] || opp_party == []
      system "clear"
      trainer = switch
      load_scoreboard(opp_party)
      user_choice = prompt.select("Select a Pokemon to battle!", user_party)
      user_pokemon = (Pkmn.find_by name: user_choice.downcase)
      user_pokemon_stat = UserPkmn.find_by pkmn_id: user_pokemon.id, user_id: self.id
      opp_choice = opp_party.sample
      opp_pokemon = (Pkmn.find_by name: opp_choice.downcase)

      # finding user/opponent pokemon types
      user_type = (Pkmn.find_by name: user_choice.downcase).element
      opp_type = (Pkmn.find_by name: opp_choice.downcase).element

      # pre-battle announcement
      puts "I choose you #{user_choice}(#{user_type.capitalize})!"
      sleep(1.5)
      puts "Your opponent chooses #{opp_choice}(#{opp_type.capitalize})!"
      sleep(1.5)

      # if user lose
      if battle_conditions(user_type, opp_type) == "loss"
        puts "#{user_choice} was not effective against #{opp_choice}!"
        sleep (0.75)
        puts "#{user_choice} fainted."
        puts "You Lose!"

        if trainer == true
          loss_trainer(user_pokemon_stat)
        else
          loss_menu(user_pokemon, user_pokemon_stat)
        end
        user_party.delete(user_choice)

      # if user win
      elsif battle_conditions(user_type, opp_type) == "win"
        puts "#{user_choice} was super effective against #{opp_choice}!"
        puts "Opponent's #{opp_choice} fainted."
        sleep (0.75)
        puts "You Win!"

        if trainer == true
          win_trainer(user_pokemon, user_pokemon_stat)
        else
          win_menu(user_pokemon, user_pokemon_stat)
        end
        opp_party.delete(opp_choice)

      # if draw compare base_experience to declare winner
      else
        user_exp = 0
        if user_pokemon_stat != nil
          user_exp = user_pokemon_stat.exp
        end

        user_pokemon_total_exp = user_pokemon.base_experience + user_exp

        # DRAW-WIN if User base exp is greater
        if user_pokemon_total_exp > opp_pokemon.base_experience
          puts "Your #{user_choice} is more experienced than your opponent's #{opp_choice}!"
          sleep(0.75)
          puts "Opponent's #{opp_choice} fainted."
          sleep(0.75)
          puts "You Win!"
          sleep(0.75)

          if trainer == true
            win_trainer(user_pokemon, user_pokemon_stat)
          else
            win_menu(user_pokemon, user_pokemon_stat)
          end
          opp_party.delete(opp_choice)

        # DRAW-LOSE if User base exp is less
        elsif user_pokemon_total_exp < opp_pokemon.base_experience
          puts "Your #{user_choice} is less experienced than your opponent's #{opp_choice}!"
          puts "#{user_choice} fainted."
          sleep(0.75)
          puts "You Lose!"

          if trainer == true
            loss_trainer(user_pokemon_stat)
          else
            loss_menu(user_pokemon, user_pokemon_stat)
          end
          user_party.delete(user_choice)
        # DRAW and both pokemon faint
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

    if switch == true
      if opp_party == []
        puts "Congratulations, you won the Pokemon battle!"
        sleep(1)
      else
        puts "Shame, you lost the Pokemon Battle..."
        sleep(1)
      end
    end
  end

end
