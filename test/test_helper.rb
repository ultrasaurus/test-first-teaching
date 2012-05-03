require 'wrong'
include Wrong
require 'files'
include Files

Wrong.config.verbose
Wrong.config.color

here = File.expand_path(File.dirname __FILE__)
$:<< File.expand_path("#{here}/../lib")
