class FileWriter

  def initialize template_renderer, file_maker
    raise ArgumentError, 'TemplateRenderer missing' if template_renderer.nil?
    raise ArgumentError, 'FileMaker missing' if file_maker.nil?
    @template_renderer = template_renderer
    @file_maker = file_maker
  end

  def write_to_page filename, display_data
    #puts ">>> BEFORE: #{display_data.title}, #{display_data.navigation}"

    @file_maker.make_writable(filename,
                              lambda{|file|
                                content =  @template_renderer.render display_data
                                #puts content
                                file.puts content})
  end

end