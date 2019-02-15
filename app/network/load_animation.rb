# Loops through animation directory, printing out each file
def load_battle_animation
  i = 0

  while i <= 20
    system "clear"

    File.foreach("animation/0#{i}-battle.rb") { |f| puts f }
    sleep(0.15)
    i += 1
  end
end

def text_anim(string)
  string.each_char do |chr|
    print chr
    sleep(0.05)
  end
  puts "\n"
end
