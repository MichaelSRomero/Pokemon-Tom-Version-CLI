# def battle
#   # prompt.select("Pick a Pokemon", choice_arr)
#   # 3.times do
#   #   puts "Pick another Pokemon"
#   #   choice_arr.each_with_index do |pokemon, i|
#   #     puts "#{i+1}. #{pokemon.name.capitalize}"
#   #   end
#   #   input = gets.chomp
#   #   choice_arr.delete_at(input.to_i-1)
#   #   opponent = choice_arr.sample(1)
#   #   puts opponent[0].name
#   #   choice_arr.delete(opponent[0])
#   # end
# end

def setup(user)
  prompt = TTY::Prompt.new(active_color: :cyan)
  random = Pkmn.all.sample(6)
  random.map! { |pokemon| pokemon.name.capitalize  }
  prompt.select("Choose your Pokemon") do |menu|
    menu.enum ')'

    menu.choice random[0], -> {battle(random, 0, user)}
    menu.choice random[1], -> {battle(random, 1, user)}
    menu.choice random[2], -> {battle(random, 2, user)}
    menu.choice random[3], -> {battle(random, 3, user)}
    menu.choice random[4], -> {battle(random, 4, user)}
    menu.choice random[5], -> {battle(random, 5, user)}
  end

  prompt.select("Choose your Pokemon") do |menu|
    menu.enum ')'

    menu.choice random[0], -> {battle(random, 0, user)}
    menu.choice random[1], -> {battle(random, 1, user)}
    menu.choice random[2], -> {battle(random, 2, user)}
    menu.choice random[3], -> {battle(random, 3, user)}
  end

  prompt.select("Choose your Pokemon") do |menu|
    menu.enum ')'

    menu.choice random[0], -> {battle(random, 0, user)}
    menu.choice random[1], -> {battle(random, 1, user)}
  end

end

def battle(arr, i, user)
  prompt = TTY::Prompt.new(active_color: :cyan)
  my_type = (Pkmn.find_by name: arr[i].downcase)
  opponent_type = (Pkmn.find_by name: opponent(arr, i).downcase)
  if battle_mechanic(my_type.element, opponent_type.element) == "win"
    puts "You Win!"
    if (UserPkmn.find_by pkmn_id: my_type.id, user_id: user.id) == nil
      prompt.select("Catch this Pokemon?") do |menu|
        menu.choice "Yes", -> {yes_capture(user,my_type)}
        menu.choice "No", -> {no_capture(user, my_type)}
      end
    else
      pokemon = UserPkmn.find_by pkmn_id: my_type.id, user_id: User.all[0].id
      puts pokemon.nickname
      pokemon.win += 1
      pokemon.save
    end
  else
    puts "You Lose!"
    if (UserPkmn.find_by pkmn_id: my_type.id, user_id: user.id) == nil
      puts "test"
      UserPkmn.create(win: 0, loss: 1, user_id: user.id, pkmn_id: my_type.id)
    else
      pokemon = UserPkmn.find_by pkmn_id: my_type.id, user_id: User.all[0].id
      puts pokemon.nickname
      pokemon.loss += 1
      pokemon.save
    end
  end
end

def opponent(arr, i)
  delete_choice(arr, i)
  num = rand(arr.length)
  opponent = arr[num]
  delete_choice(arr, num)
  puts "Your opponent is #{opponent}"
  return opponent
end

def delete_choice(arr, i)
  arr.delete_at(i)
end

def yes_capture(user, pokemon)
  prompt = TTY::Prompt.new(active_color: :cyan)
  nickname = prompt.ask("Nickname your Pokemon:", default: pokemon.name.capitalize)
  UserPkmn.create(nickname: nickname, win: 1, loss: 0, captured: true, user_id: user.id, pkmn_id: pokemon.id)
end

def no_capture(user, pokemon)
  UserPkmn.create(win: 1, loss: 0, user_id: user.id, pkmn_id: pokemon.id)
end
