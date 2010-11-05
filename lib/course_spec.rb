here = File.expand_path(File.dirname(__FILE__))

require 'course'
require 'wrong'
include Wrong

describe Course do
  it "lists all modules under the curriculum dir" do
    modules = Course.all_modules("#{here}/../learn_ruby")
    assert { modules.include? "array" }
    assert { modules.include? "simon_says" }
    # dumb test, but better than nothing
  end

  it 'initializes from a curriculum name and a course name' do
    c = Course.new("foo", "bar")
    assert { c.curriculum_name = "foo" }
    assert { c.course_name = "bar" }
  end
  
  it 'initializes from a course name' do
    c = Course.new("bar")
    assert { c.curriculum_name = "learn_ruby" }
    assert { c.course_name = "bar" }
  end
end  
