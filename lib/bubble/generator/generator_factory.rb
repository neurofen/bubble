class GeneratorFactory

  def initialize processor, bubbleStore
    @processor = processor
    @bubble_store = bubbleStore
  end

  def createGeneratorFor output_path, template_renderer
    generator = Generator.new(@processor, @bubble_store, output_path)
    generator.use(FileWriter.new(template_renderer))
    generator
  end
end