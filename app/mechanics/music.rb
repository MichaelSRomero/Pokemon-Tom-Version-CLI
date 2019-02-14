def play_music(file)
    fork{ exec 'afplay', "#{file}"}
end

def stop_music
  fork{ exec 'killall', 'afplay'}
  sleep(0.1)
end

def load_intro_music
  play_music("sound/pkmn-opening.mp3")
end

def load_user_menu_music
    play_music("sound/pkmn-pokemon center.mp3")
end

def load_battle_music
  play_music("sound/pkmn-battle (vs wild pokemon).mp3")
end

def load_user_victory_music
  play_music("sound/pkmn - victory (vs wild pokemon).mp3")
end

def load_trainer_battle_music
  play_music("sound/pkmn-last battle(vs rival).mp3")
end
