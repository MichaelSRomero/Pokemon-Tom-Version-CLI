############################################
## ---------- H2P MENU METHOD ------------##
############################################

def how_to_play_menu
  system "clear"
  load_logo_ascii

  prompt.select("HOW TO PLAY\n") do |menu|
    menu.choice "Type Chart", -> {load_type_chart}
    menu.choice "Battle Rules", -> {load_battle_rules}
    menu.choice "Go Back", -> {log_in_menu}
  end
end

############################################
## ----------- MENU CHOICES --------------##
############################################

def load_type_chart
  system "clear"
  puts " ATTACKER  | STRONG AGAINST"
  puts " -----------------------------------------"
  type_rules.each do |type, type_arr|
    row = "   #{type.capitalize}       ".ljust(18)
    type_arr.each { |weak_type| row += " #{weak_type.capitalize}"}
    puts row
  end

  prompt.select("") {|menu| menu.choice "Go Back", -> {how_to_play_menu}}
end

def load_battle_rules
  puts " GOAL:       defeat all opponents Pokemon\n\n"
  puts " SCOREBOARD: YOUR pokemon are displayed at bottom, OPPONENT is displayed above"
  puts " WIN:        YOUR pokemon type is strong against OPPONENT type"
  puts " LOSE:       OPPONENT type is strong against YOUR pokemon type"
  puts " DRAW:       BOTH pokemon types are equal or normal damage;"
  puts "             then are compared using their BASE EXP + EXP"
  puts " CATCH:      allowed to catch the chosen pokemon if it wins its round"
  puts " GAIN EXP:   if pokemon is caught and wins its round, then it gains 1EXP"

  prompt.select("") {|menu| menu.choice "Go Back", -> {how_to_play_menu}}
end
