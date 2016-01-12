def calculate_bottles(bottles, total, caps, total_from_caps, total_from_bottles)

  breakdown = "You obtained #{total} bottles. #{total_from_caps} were from recycling caps; #{total_from_bottles} were from recycling bottles. You have #{bottles} bottles left over and #{caps} caps."
  return breakdown if bottles < 2 && caps < 4

  bottles, total, caps, total_from_caps = bottle_caps(bottles, total, caps, total_from_caps)
  bottles, total, caps, total_from_bottles = empty_bottles(bottles, total, caps, total_from_bottles)

  calculate_bottles(bottles, total, caps, total_from_caps, total_from_bottles)

end

def bottle_caps(bottles, total, caps, total_from_caps)
    total += caps / 4
    total_from_caps += caps / 4
    bottles += caps / 4
    caps = (caps % 4) + (caps / 4)

    return bottles, total, caps, total_from_caps

end

def empty_bottles(bottles, total, caps, total_from_bottles)
    total += bottles / 2
    total_from_bottles += bottles / 2
    caps += bottles / 2
    bottles -= bottles / 2

    return bottles, total, caps, total_from_bottles

end

def prompt_user

  while true
    puts "How much would you like to spend? "

    to_spend = gets.chomp.to_i
    total = caps = bottles = to_spend / 2
    total_from_caps = total_from_bottles = 0

    puts calculate_bottles(bottles, total, caps, total_from_caps, total_from_bottles)
  end

end

prompt_user
