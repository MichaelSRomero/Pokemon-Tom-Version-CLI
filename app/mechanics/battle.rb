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

def setup
  prompt = TTY::Prompt.new(active_color: :cyan)
  random = Pkmn.all.sample(6)
  random.map! { |pokemon| pokemon.name.capitalize  }
  prompt.select("Choose your Pokemon") do |menu|
    menu.enum ')'

    menu.choice random[0], -> {battle(random, 0)}
    menu.choice random[1], -> {battle(random, 1)}
    menu.choice random[2], -> {battle(random, 2)}
    menu.choice random[3], -> {battle(random, 3)}
    menu.choice random[4], -> {battle(random, 4)}
    menu.choice random[5], -> {battle(random, 5)}
  end

  prompt.select("Choose your Pokemon") do |menu|
    menu.enum ')'

    menu.choice random[0], -> {battle(random, 0)}
    menu.choice random[1], -> {battle(random, 1)}
    menu.choice random[2], -> {battle(random, 2)}
    menu.choice random[3], -> {battle(random, 3)}
  end

  prompt.select("Choose your Pokemon") do |menu|
    menu.enum ')'

    menu.choice random[0], -> {battle(random, 0)}
    menu.choice random[1], -> {battle(random, 1)}
  end

end

def battle(arr, i)
  my_type = (Pkmn.find_by name: arr[i].downcase)
  opponent_type = (Pkmn.find_by name: opponent(arr, i).downcase)
  if battle_mechanic(my_type.element, opponent_type.element) == "win"
    puts "You Win!"
  else
    puts "You Lose!"
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
