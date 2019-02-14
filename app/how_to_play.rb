def how_to_play_menu
  system "clear"
  load_logo_ascii
  prompt.select("HOW TO PLAY\n") do |menu|
    menu.choice "Type Chart", -> {load_type_chart}
    menu.choice "Battle Rules", -> {load_battle_rules}
    menu.choice "Go Back", -> {log_in_menu}
  end
end

def load_type_chart
  system "clear"
  puts " ATTACKER  | STRONG AGAINST"
  puts " -----------------------------------------"
  type_rules.each do |type, type_arr|
    row = "   #{type.capitalize}         "
    type_arr.each { |weak_type| row += " #{weak_type.capitalize}"}
    puts row
  end

  prompt.select("") {|menu| menu.choice "Go Back", -> {how_to_play_menu}}
end

def load_battle_rules
  puts "Empty"

  prompt.select("") {|menu| menu.choice "Go Back", -> {how_to_play_menu}}
end
