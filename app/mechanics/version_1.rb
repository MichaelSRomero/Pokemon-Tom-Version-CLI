# # version 1 battle_mechanic.
# def battle_mechanic(type, opponent)
#   type_circle = {
#     fire: "grass",
#     grass: "water",
#     water: "fire"
#   }
#   if type_circle[opponent.to_sym] == type
#     return "lose"
#   elsif type_circle[type.to_sym] == opponent
#     return "win"
#   else
#     puts "Sudden death!"
#     draw_game
#   end
# end
#
# # draw game methods.
# def win
#   puts "You won, now pick the same hand as your opponent to win!"
#   prompt = TTY::Prompt.new(active_color: :cyan)
#   rule = {
#     Rock: "Scissor",
#     Scissor: "Paper",
#     Paper: "Rock"
#   }
#   hand =  prompt.select("Rock, Paper, or Scissor?") do |menu|
#     menu.choice "Rock"
#     menu.choice "Paper"
#     menu.choice "Scissor"
#   end
#   opponent = [:Rock, :Paper, :Scissor].sample
#   puts "Your opponent throws out a #{opponent.to_s}!"
#   if hand == opponent.to_s
#     return "win"
#   elsif rule[opponent] == hand
#     loss
#   else
#     win
#   end
# end
#
# def loss
#   puts "You lost, if your opponent picks the same hand as you, you lose!"
#   prompt = TTY::Prompt.new(active_color: :cyan)
#   rule = {
#     Rock: "Scissor",
#     Scissor: "Paper",
#     Paper: "Rock",
#   }
#   hand =  prompt.select("Rock, Paper, or Scissor?") do |menu|
#     menu.choice "Rock"
#     menu.choice "Paper"
#     menu.choice "Scissor"
#   end
#   opponent = [:Rock, :Paper, :Scissor].sample
#   puts "Your opponent throws out a #{opponent.to_s}!"
#   if hand == opponent.to_s
#     return "lose"
#   elsif rule[hand.to_sym] == opponent.to_s
#     win
#   else
#     puts "Tie, one more round!"
#     loss
#   end
# end
#
# def draw_game
#   prompt = TTY::Prompt.new(active_color: :cyan)
#   rule = {
#     Rock: "Scissor",
#     Scissor: "Paper",
#     Paper: "Rock"
#   }
#   hand =  prompt.select("Rock, Paper, or Scissor?") do |menu|
#     menu.choice "Rock"
#     menu.choice "Paper"
#     menu.choice "Scissor"
#     menu.choice "Surrender"
#   end
#   opponent = [:Rock, :Paper, :Scissor].sample
#   puts "Your opponent throws out a #{opponent.to_s}!"
#   if hand == "Surrender"
#     return "lose"
#   elsif rule[opponent] == hand
#     loss
#   elsif rule[hand.to_sym] == opponent.to_s
#     win
#   else
#     draw_game
#   end
# end
#
#   # old rock, paper, scissor logic.
#   case type
#   when "fire"
#     if opponent == "water"
#       return "lose"
#     elsif opponent == "grass"
#       return "win"
#     else
#       puts "Sudden death!"
#       if rand(0..1) == 1
#         return "win"
#       else
#         return "lose"
#       end
#     end
#   when "water"
#     if opponent == "grass"
#       return "lose"
#     elsif opponent == "fire"
#       return "win"
#     else
#       puts "Sudden death!"
#       if rand(0..1) == 1
#         return "win"
#       else
#         return "lose"
#       end
#     end
#   when "grass"
#     if opponent == "fire"
#       return "lose"
#     elsif opponent == "water"
#       return "win"
#     else
#       puts "Sudden death!"
#       if rand(0..1) == 1
#         return "win"
#       else
#         return "lose"
#       end
#     end
#   end
#
#   # old battle logic without TTY-Prompt.
#   def battle
#     prompt.select("Pick a Pokemon", choice_arr)
#     3.times do
#       puts "Pick another Pokemon"
#       choice_arr.each_with_index do |pokemon, i|
#         puts "#{i+1}. #{pokemon.name.capitalize}"
#       end
#       input = gets.chomp
#       choice_arr.delete_at(input.to_i-1)
#       opponent = choice_arr.sample(1)
#       puts opponent[0].name
#       choice_arr.delete(opponent[0])
#     end
#   end
#
#   # old battle setup.
#   def setup(user)
#     stop_music
#     load_battle_music
#     sleep(1)
#     load_battle_animation
#     system "clear"
#     prompt = TTY::Prompt.new(active_color: :cyan)
#     random = Pkmn.all.sample(6)
#
#     random.map! { |pokemon| pokemon.name.capitalize  }
#
#     # First Battle Choice
#     prompt.say("Whoa! A horde of wild Pokemon appeared!")
#     sleep(0.5)
#     prompt.select("Choose your Pokemon") do |menu|
#       menu.enum ')'
#
#       menu.choice random[0], -> {battle(random, 0, user)}
#       menu.choice random[1], -> {battle(random, 1, user)}
#       menu.choice random[2], -> {battle(random, 2, user)}
#       menu.choice random[3], -> {battle(random, 3, user)}
#       menu.choice random[4], -> {battle(random, 4, user)}
#       menu.choice random[5], -> {battle(random, 5, user)}
#     end
#
#     # Second Battle Choice
#     prompt.select("Choose your Pokemon") do |menu|
#       menu.enum ')'
#
#       menu.choice random[0], -> {battle(random, 0, user)}
#       menu.choice random[1], -> {battle(random, 1, user)}
#       menu.choice random[2], -> {battle(random, 2, user)}
#       menu.choice random[3], -> {battle(random, 3, user)}
#     end
#
#     # Last Battle Choice
#     prompt.select("Choose your Pokemon") do |menu|
#       menu.enum ')'
#
#       menu.choice random[0], -> {battle(random, 0, user)}
#       menu.choice random[1], -> {battle(random, 1, user)}
#     end
#     stop_music
#   end
#
#   # old battle method.
#   def battle(arr, i, user)
#     prompt = TTY::Prompt.new(active_color: :cyan)
#     my_type = (Pkmn.find_by name: arr[i].downcase)
#     opponent_type = (Pkmn.find_by name: opponent(arr, i).downcase)
#
#     if battle_mechanic(my_type.element, opponent_type.element) == "win"
#       puts "You Win!"
#       if (UserPkmn.find_by pkmn_id: my_type.id, user_id: user.id) == nil
#         prompt.select("Catch this Pokemon?") do |menu|
#           menu.choice "Yes", -> {yes_capture(user,my_type)}
#           menu.choice "No", -> {no_capture(user, my_type)}
#         end
#       else
#         pokemon = UserPkmn.find_by pkmn_id: my_type.id, user_id: User.all[0].id
#         pokemon.win += 1
#         pokemon.save
#       end
#     else
#       puts "You Lose!"
#       if (UserPkmn.find_by pkmn_id: my_type.id, user_id: user.id) == nil
#         UserPkmn.create(win: 0, loss: 1, user_id: user.id, pkmn_id: my_type.id)
#       else
#         pokemon = UserPkmn.find_by pkmn_id: my_type.id, user_id: User.all[0].id
#         puts pokemon.nickname
#         pokemon.loss += 1
#         pokemon.save
#       end
#     end
#   end
#
#   def opponent(arr, i)
#     delete_choice(arr, i)
#     num = rand(arr.length)
#     opponent = arr[num]
#     delete_choice(arr, num)
#
#     puts "Your opponent is #{opponent}"
#     return opponent
#   end
#
#   def delete_choice(arr, i)
#     arr.delete_at(i)
#   end
#
#   # old battle capture methods.
#   def yes_capture(user, pokemon)
#     prompt = TTY::Prompt.new(active_color: :cyan)
#     nickname = prompt.ask("Nickname your Pokemon:", default: pokemon.name.capitalize)
#     UserPkmn.create(nickname: nickname, win: 1, loss: 0, captured: true, user_id: user.id, pkmn_id: pokemon.id)
#   end
#
#   def no_capture(user, pokemon)
#     UserPkmn.create(win: 1, loss: 0, user_id: user.id, pkmn_id: pokemon.id)
#   end
