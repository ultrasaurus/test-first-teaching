# Solution to problem bottles from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 12/01/14

def bottles(num_bottles)

	msg = ''
	while num_bottles > 0
		msg += "#{num_bottles} #{pluralize_bottles(num_bottles)} of beer on the wall. "
		msg += "#{num_bottles} #{ pluralize_bottles(num_bottles)} of beer.\n"
		msg += "Take one down and pass it around.\n"
		num_bottles -= 1
		break if (num_bottles == 0)
		msg += "#{num_bottles} #{pluralize_bottles(num_bottles)} of beer on the wall.\n"
	end

	msg += "No more bottles of beer on the wall.\n"

end

def pluralize_bottles(num_bottles)
	if (num_bottles > 1)
		return "bottles"
	end
	return "bottle"
end
