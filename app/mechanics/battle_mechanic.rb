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
def battle_mechanic(type, opponent)
  type_circle = {
    fire: "grass",
    grass: "water",
    water: "fire"
  }
  (type_circle[opponent.to_sym]).find {|element| element == type}
  if type_circle[opponent.to_sym] == type
    return "lose"
  elsif type_circle[type.to_sym] == opponent
    return "win"
  else
    puts "Sudden death!"
    draw_game
  end
end

def win
  puts "You won, now pick the same hand as your opponent to win!"
  prompt = TTY::Prompt.new(active_color: :cyan)
  rule = {
    Rock: "Scissor",
    Scissor: "Paper",
    Paper: "Rock"
  }
  hand =  prompt.select("Rock, Paper, or Scissor?") do |menu|
    menu.choice "Rock"
    menu.choice "Paper"
    menu.choice "Scissor"
  end
  opponent = [:Rock, :Paper, :Scissor].sample
  puts "Your opponent throws out a #{opponent.to_s}!"
  if hand == opponent.to_s
    return "win"
  elsif rule[opponent] == hand
    loss
  else
    win
  end
end

def loss
  puts "You lost, if your opponent picks the same hand as you, you lose!"
  prompt = TTY::Prompt.new(active_color: :cyan)
  rule = {
    Rock: "Scissor",
    Scissor: "Paper",
    Paper: "Rock",
  }
  hand =  prompt.select("Rock, Paper, or Scissor?") do |menu|
    menu.choice "Rock"
    menu.choice "Paper"
    menu.choice "Scissor"
  end
  opponent = [:Rock, :Paper, :Scissor].sample
  puts "Your opponent throws out a #{opponent.to_s}!"
  if hand == opponent.to_s
    return "lose"
  elsif rule[hand.to_sym] == opponent.to_s
    win
  else
    puts "Tie, one more round!"
    loss
  end
end

def draw_game
  prompt = TTY::Prompt.new(active_color: :cyan)
  rule = {
    Rock: "Scissor",
    Scissor: "Paper",
    Paper: "Rock"
  }
  hand =  prompt.select("Rock, Paper, or Scissor?") do |menu|
    menu.choice "Rock"
    menu.choice "Paper"
    menu.choice "Scissor"
    menu.choice "Surrender"
  end
  opponent = [:Rock, :Paper, :Scissor].sample
  puts "Your opponent throws out a #{opponent.to_s}!"
  if hand == "Surrender"
    return "lose"
  elsif rule[opponent] == hand
    loss
  elsif rule[hand.to_sym] == opponent.to_s
    win
  else
    draw_game
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
