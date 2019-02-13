require_relative '../config/environment'

# def test
#   fire_types = fetch_api("fire")
#   fire_types["pokemon"][0]["pokemon"]["name"]
# end
#
# def choooose
#   prompt = TTY::Prompt.new(active_color: :cyan)
#
#   choices = {Squirtle: 1, bulbasaur: 2, charmander: test}
#   chosen = prompt.select("Choose your destiny?", choices)
#   puts "You have picked: #{chosen}"
# end
#
# choooose

# http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=About%20us

system "clear"
load_intro_music
puts "
  ██████╗  ██████╗ ██╗  ██╗███████╗███╗   ███╗ ██████╗ ███╗   ██╗
  ██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝████╗ ████║██╔═══██╗████╗  ██║
  ██████╔╝██║   ██║█████╔╝ █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
  ██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
  ██║     ╚██████╔╝██║  ██╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
  ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                        - TOM VERSION -

                                          * James Kang
                                          * Michael Romero




"
log_in_menu
