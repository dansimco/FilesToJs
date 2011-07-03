require File.join(File.dirname(__FILE__), '../src/TemplatesToJs')
template_joiner = TemplatesToJs.new({
  :template_dir    => 'templates',
  :template_format => 'mustache',
  :js_object_name  => 'templates',
  :output          => 'output/mytemplates.js'
})
template_joiner.write_js
puts template_joiner.js