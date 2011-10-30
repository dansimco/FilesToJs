require 'rubygems'

require_relative '../lib/FilesToJS'

describe FilesToJs do

  before :all do

  end

  it 'should concatenate javascript without catching fire' do
    template_joiner = FilesToJs.new({
      :file_dir    => 'templates',
      :file_format => 'mustache',
      :js_object_name  => 'templates',
      :output          => 'output/mytemplates.js'
    })
    template_joiner.write_js
    puts template_joiner.js
  end


end