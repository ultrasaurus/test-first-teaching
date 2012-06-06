class Lab
  def initialize curriculum_name, lab_name
    @curriculum_name = curriculum_name
    @name = lab_name
  end

  def name
    @name
  end

  #todo: move to Curriculum (Area) object
  def curriculum_dir
    "#{Course.root}/#{@curriculum_name}"
  end

  def dir
    "#{curriculum_dir}/#{name}"
  end

  def test_file
    "#{dir}/#{name}_spec.rb"
  end

  def notes_file
    "#{dir}/index.md"
  end
end
