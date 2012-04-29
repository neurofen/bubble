class Processor

  def initialize xml_filename, output_path
    @xml_filename = xml_filename
    @output_path = output_path
    bubbleStore = BubbleStore.new
    @ingester = Ingester.new(self, bubbleStore)
    @generatorFactory = GeneratorFactory.new(self, bubbleStore)

  end

  def start
    @ingester.startIngesting @xml_filename
  end

  def next
    @generatorFactory.createGeneratorFor(@output_path).start
  end

  def done
    puts "finished processing - provide basic run stats"
  end

end