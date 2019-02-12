require "pry"
def display_user_menu(user)
  system "clear"
  stop_music
  load_user_menu_music
  prompt = TTY::Prompt.new(active_color: :cyan)

  until false
    prompt.select("\n#{user.name.upcase}\'s MENU \n") do |menu|
      menu.choice "Battle!", -> {setup(user)}
      menu.choice "Battle Record", -> {battle_record(user)}
      menu.choice "My Pokemon", -> {my_pokemon(user)}
      menu.choice "Change Name", -> {"Changing name to ----"}
      menu.choice "Exit", -> {exit_menu(user)}
    end
  end
end

def my_pokemon(user)
  system "clear"
  user_pokemon = UserPkmn.all.where user_id: user.id, captured: true
  puts user_pokemon.map { |row| "#{row.pkmn.name.capitalize}, nicknamed: #{row.nickname}" }
end

def battle_record(user)
  user_stat = UserPkmn.all.where user_id: user.id
  puts (user_stat.map{ |row| "#{row.pkmn.name.capitalize} has, Win: #{row.win}, Loss: #{row.loss}" }).sort
end

def exit_menu(user)
  puts "Goodbye Pokemon Master, #{user.name}!"

  stop_music
  exit
end
