require 'yaml'

class Course
  attr_accessor :curriculum_name, :course_name

  def initialize(curriculum_name, course_name = nil)
    if course_name.nil?
      course_name = curriculum_name
      curriculum_name = "learn_ruby"
    end
    @curriculum_name, @course_name = curriculum_name, course_name
  end
  
  # todo: move to Curriculum object
  def self.all_chapters(curriculum_name)
    chapters = Dir.glob("learn_ruby/*").
    select{|d| File.directory?(d)}.
    map{|d| d.split('/')[1]}
  end
  
end
