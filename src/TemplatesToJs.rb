class TemplatesToJs
  attr_reader :js
  
  def initialize(params = {})
    @template_dir     =  params[:template_dir]    || "templates"
    @template_format  =  params[:template_format] || "mustache"
    @js_object_name   =  params[:js_object_name]  || "templates"
    @output = params[:output] || false
  end
  def list_templates
    @templates = Dir.glob("#{@template_dir}/*.#{@template_format}")
    return @templates
  end
  def render_js
   @js = "#{@js_object_name} = {};"
   list_templates.each { |template_path|
     template_filename = template_path.split('/').last.split('.').first
     template_string = ""
     File.open("#{template_path}",'r') do |f1|
       while line = f1.gets
         template_string = template_string + line.gsub('\'','"').strip
       end
     end
     @js = @js + "templates['#{template_filename}']='#{template_string}';"
   }
  return @js
  end
  def write_js
    render_js unless @js
    if @output then
      File.open(@output,'w') { |f| 
         f.write(@js) 
       }
    end
  end
end