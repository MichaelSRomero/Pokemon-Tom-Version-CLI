def battle_mechanic(type, opponent)
  case type
  when "fire"
    if opponent == "water"
      return "lose"
    elsif opponent == "grass"
      return "win"
    else
      if rand(0..1) == 1
        return "win"
      else
        return "lose"
      end
    end
  when "water"
    if opponent == "grass"
      return "lose"
    elsif opponent == "fire"
      return "win"
    else
      if rand(0..1) == 1
        return "win"
      else
        return "lose"
      end
    end
  when "grass"
    if opponent == "fire"
      return "lose"
    elsif opponent == "water"
      return "win"
    else
      if rand(0..1) == 1
        return "win"
      else
        return "lose"
      end
    end
  end
end
