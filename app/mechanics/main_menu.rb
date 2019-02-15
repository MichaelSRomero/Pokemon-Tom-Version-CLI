############################################
## --------- MAIN MENU METHOD ------------##
############################################

def log_in_menu
  system "clear"
  load_logo_ascii
  sleep(1.5)

  until false
    prompt.select("Are you an existing or new player?") do |menu|
      menu.choice "New User", -> {new_user}
      menu.choice "Existing User", -> {load_user}
      menu.choice "How to Play", -> {how_to_play_menu}
      menu.choice "Exit", -> {exit_program}
    end
  end
end

############################################
## ----------- MENU CHOICES --------------##
############################################

def new_user
  sleep(0.75)

  user_name = prompt.ask("Please insert a user-name...")
  if user_name == "Back"
    puts "Back, isn't a usable name!"
    sleep(1)
    puts "Please enter a valid user name"
    puts "\n"
    sleep(1.5)
    new_user
  end
  user = User.create(name: user_name)
  display_user_menu(user)
end

def load_user
  sleep(0.75)

  if User.all == []
    puts "There are no existing users, returning to main menu!"
    puts "\n"
    sleep(1.5)
    log_in_menu
  end

  users = User.all.map { |user| user.name }
  users << "Back"

  user_name = prompt.select("Select your name!", users)
  log_in_menu if user_name == "Back"
  user = User.find_by(name: user_name)

  if user != nil
    prompt.say("Welcome back #{user.name}!")
    display_user_menu(user)
  else
    prompt.error("Sorry, could not find user: >>> #{user_name} <<<")
  end
end

def exit_program
  stop_music
  exit
end
