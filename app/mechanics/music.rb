def play_music(file)
  fork{ exec 'afplay', "#{file}"}
end

def intro_music
  play_music("sound/pkmn-opening.mp3")
end

def user_menu_music
  play_music("sound/pkmn-pokemon center.mp3")
end

def battle_music
  play_music("sound/pkmn-battle (vs wild pokemon).mp3")
end

def victory_music
  play_music("sound/pkmn - victory (vs wild pokemon).mp3")
end
