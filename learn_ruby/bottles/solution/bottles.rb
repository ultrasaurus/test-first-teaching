def on_the_wall bottle_count
  "#{bottles_of_beer(bottle_count)} on the wall."
end

def bottles_of_beer bottle_count
  if bottle_count == 1
    "1 bottle of beer"
  else
    "#{bottle_count} bottles of beer"
  end
end

def verse(bottle_count)
  "#{on_the_wall(bottle_count)} #{bottles_of_beer(bottle_count)}."
end

def take_one_down
  "Take one down and pass it around."
end

def bottles(bottle_count)
  out = ""

  while bottle_count > 1
    out += <<-MESSAGE
#{verse(bottle_count)}
#{take_one_down}
#{on_the_wall(bottle_count - 1)}
    MESSAGE
    bottle_count -= 1
  end

  if bottle_count == 1
    out += <<-MESSAGE
#{verse(bottle_count)}
#{take_one_down}
    MESSAGE
  end

  out += "No more bottles of beer on the wall.\n"
end
