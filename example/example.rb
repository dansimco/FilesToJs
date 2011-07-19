require File.join(File.dirname(__FILE__), '../src/FilesToJs')
template_joiner = FilesToJs.new({
  :file_dir    => 'templates',
  :file_format => 'mustache',
  :js_object_name  => 'templates',
  :output          => 'output/mytemplates.js'
})
template_joiner.write_js
puts template_joiner.js