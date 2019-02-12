def display_user_menu(user)
  stop_music
  load_user_menu_music
  prompt = TTY::Prompt.new(active_color: :cyan)

  prompt.select("\n#{user.name.upcase}\'s MENU") do |menu|
    menu.choice "Battle!", -> {"It\'s battle time!!!"}
    menu.choice "Battle Record", -> {" Display battle record"}
    menu.choice "My Pokemon", -> {"List all my Pokemon I\'ve caught"}
    menu.choice "Change Name", -> {"Changing name to ----"}
  end
end
