#FilesToJs

FilesToJs is a ruby class which will take a directory of text files and formats them as string values in a global javascript object. An advantage of this is the ability to use the same directory of templates for both back end and front end rendering, and have all your templates in a single compressed transfer.

Mustache Template example:

    template_joiner = TemplatesToJs.new({
      :template_dir    => 'templates',  #Defaults to "templates"
      :template_format => 'mustache',   #Defaults to "*"
      :js_object_name  => 'templates',  #Defaults to "files"
      :output          => 'output/mytemplates.js'  #Path to write .js file, Defaults to false
    })
    template_joiner.write_js
    puts template_joiner.js
    
    