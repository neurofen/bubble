class GeneratorFactory

  def initialize processor, template
    raise ArgumentError, 'Processor missing' if processor.nil?
    raise ArgumentError, 'template filename missing' if template.nil? || template.empty?
    @processor = processor
    @template = template
  end

  def create_generator_for output_path
    Generator.new(@processor, output_path, create_file_writer)
  end

  private
    def create_file_writer
      FileWriter.new(create_template_renderer)
    end

    def create_template_renderer
      DataTemplateBinder.new(read_template_content)
    end

    def read_template_content
      File.open(@template) do |file|
        return file.read
      end
    end
end