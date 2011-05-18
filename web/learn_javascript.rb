require "page"
require "learn"

class LearnJavaScript < Learn
  def lang
    "JavaScript"
  end

  # override so it doesn't become learn_java_script
  def page_id
    "learn_javascript"
  end
end

