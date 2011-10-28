class FilesToJs
  attr_reader :js
  def initialize(params = {})
    @file_dir     =  params[:file_dir]    || "templates"
    @file_format  =  params[:file_format] || false
    @js_object_name   =  params[:js_object_name]  || "files"
    @output = params[:output] || false
  end
  def list_files
    if @file_format then
      @files = Dir.glob("#{@file_dir}/*.#{@file_format}")
    else
      @files = Dir.glob("#{@file_dir}/*.*")
    end
    return @files
  end
  def render_js
   @js = "#{@js_object_name} = {};"
   list_files.each { |file_path|
     file_filename = file_path.split('/').last.split('.').first
     file_string = ""
     File.open("#{file_path}",'r') do |f1|
       while line = f1.gets
         file_string = file_string + line.gsub('\'','"').strip
       end
     end
     @js = @js + "#{@js_object_name}['#{file_filename}']='#{file_string}';"
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