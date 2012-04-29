class FileWriter
  def initialize template_renderer
    raise ArgumentError, 'TemplateRenderer missing' if template_renderer.nil?
    @template_renderer = template_renderer
  end

  def writeTo(output_path)

  end
end