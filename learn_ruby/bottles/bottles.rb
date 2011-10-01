def bottles_of_beer bottle_count
  if bottle_count == 1
    "1 bottle of beer"
  else
    "#{bottle_count} bottles of beer"
  end
end

def bottles(bottle_count)
  out = ""

  while bottle_count > 1
    out += <<-MESSAGE
#{bottles_of_beer(bottle_count)} on the wall. #{bottles_of_beer(bottle_count)}.
Take one down and pass it around.
#{bottles_of_beer(bottle_count - 1)} on the wall.
    MESSAGE
    bottle_count -= 1
  end

  if bottle_count == 1
    out += <<-MESSAGE
1 bottle of beer on the wall. 1 bottle of beer.
Take one down and pass it around.
    MESSAGE
  end

  out += "No more bottles of beer on the wall.\n"
end
