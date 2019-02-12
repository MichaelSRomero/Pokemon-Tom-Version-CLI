
def log_in_menu
  sleep(1.5)
  prompt = TTY::Prompt.new(active_color: :cyan)

  # choices = {"New User" => 1, "Existing User" => 2}
  until false
    prompt.select("Are you an existing or new player?") do |menu|
      menu.choice "New User", -> {new_user}
      menu.choice "Existing User", -> {load_user}
      menu.choice "Exit", -> {exit_program}
    end
  end
end

def load_user
  sleep(0.75)
  prompt = TTY::Prompt.new(active_color: :cyan)
  user_name = prompt.ask("Enter existing user-name: ")

  user = User.find_by(name: user_name)

  if user != nil
    prompt.say("Welcome back #{user.name}!")
    display_user_menu(user)
  else
    prompt.error("Sorry, could not find user: >>> #{user_name} <<<")
  end
end

def new_user
  sleep(0.75)
  prompt = TTY::Prompt.new(active_color: :cyan)

  user_name = prompt.ask("Please insert a user-name...")
  User.create(name: user_name)
end

def exit_program
  stop_music
  exit
end
