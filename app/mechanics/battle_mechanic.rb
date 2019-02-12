def battle_mechanic(type, opponent)
  type_circle = {
    fire: "grass",
    grass: "water",
    water: "fire"
  }

  if type_circle[opponent.to_sym] == type
    return "lose"
  elsif type_circle[type.to_sym] == opponent
    return "win"
  else
    puts "Sudden death!"
    if rand(0..1) == 1
      return "win"
    else
      return "false"
    end
  end
end
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
