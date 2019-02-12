def display_user_menu(user)
  prompt = TTY::Prompt.new(active_color: :cyan)

  prompt.select() do |menu|
    menu.choice "Battle!", -> {}
    menu.choice "Battle Record", -> {}
    menu.choice "My Pokemon", -> {}
    menu.choice "Change Name", -> {}

  end
end
