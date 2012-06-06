# "Ninety-nine Bottles Of Beer On The Wall" is a famous drinking song.
#
# After you make these tests pass, put the following line in your code if you want to play the full song
#
#     puts bottles(99)
#

require "rspec"
require "bottles"

describe "bottles" do
  it "says no bottles" do
    bottles(0).should == "No more bottles of beer on the wall.\n"
  end

  it "counts down from 1 bottle" do
    bottles(1).should == <<-MESSAGE
1 bottle of beer on the wall. 1 bottle of beer.
Take one down and pass it around.
No more bottles of beer on the wall.
    MESSAGE
  end

  it "counts down from 2 bottles" do
    bottles(2).should == <<-MESSAGE
2 bottles of beer on the wall. 2 bottles of beer.
Take one down and pass it around.
1 bottle of beer on the wall.
1 bottle of beer on the wall. 1 bottle of beer.
Take one down and pass it around.
No more bottles of beer on the wall.
    MESSAGE
  end

  it "counts down from 3 bottles" do
    bottles(3).should == <<-MESSAGE
3 bottles of beer on the wall. 3 bottles of beer.
Take one down and pass it around.
2 bottles of beer on the wall.
2 bottles of beer on the wall. 2 bottles of beer.
Take one down and pass it around.
1 bottle of beer on the wall.
1 bottle of beer on the wall. 1 bottle of beer.
Take one down and pass it around.
No more bottles of beer on the wall.
    MESSAGE
  end
end

