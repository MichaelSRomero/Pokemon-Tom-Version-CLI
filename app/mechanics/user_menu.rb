require "pry"
def display_user_menu(user)
  system "clear"
  stop_music
  load_user_menu_music
  prompt = TTY::Prompt.new(active_color: :cyan)

  until false
    prompt.select("\n#{user.name.upcase}\'s MENU \n") do |menu|
      menu.choice "Battle!", -> {setup2(user)}
      menu.choice "Battle Record", -> {battle_record(user)}
      menu.choice "My Pokemon", -> {my_pokemon(user)}
      menu.choice "Change Name", -> {change_name(user)}
      menu.choice "Delete Data", -> {delete_data(user)}
      menu.choice "Exit", -> {exit_menu(user)}
    end
  end
end

def delete_data(user)
  system "clear"
  prompt = TTY::Prompt.new(active_color: :cyan)
  input = prompt.select("Are you sure about deleting your data?") do |menu|
    menu.choice "I'm sure", 1
    menu.choice "Nevermind"
  end
  if input == 1
    User.destroy(user.id)
    puts "Data deleted"
    exit
  else
    puts "Nice save!"
    sleep (1)
    display_user_menu(user)
  end
end

def change_name(user)
  prompt = TTY::Prompt.new(active_color: :cyan)

  new_name = prompt.ask("Enter your new name:") do |q|
    q.required true
  end

  user.name = new_name
  user.save
end

def my_pokemon(user)
  system "clear"
  user_pokemon = UserPkmn.all.where user_id: user.id, captured: true
  puts user_pokemon.map { |row| "#{row.pkmn.name.capitalize}, nicknamed: #{row.nickname}" }
end

def battle_record(user)
  system "clear"
  user_stat = UserPkmn.all.where user_id: user.id
  puts (user_stat.map{ |row| "#{row.pkmn.name.capitalize} has, Win: #{row.win}, Loss: #{row.loss}" }).sort
end

def exit_menu(user)
  puts "Goodbye Pokemon Master, #{user.name}!"

  stop_music
  exit
end
