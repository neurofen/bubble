class Processor

  attr_reader :bubble_store

  def initialize(xml_filename, output_path, db_path)
    @xml_filename = xml_filename
    @output_path = output_path
    @bubble_store = BubbleStore.new(db_path)
    template = File.expand_path('../../data/templates/output-template.html', __FILE__)
    @ingester_facotory = IngesterFactory.new(self)
    @generator_factory = GeneratorFactory.new(self, template)
  end

  def start
    @ingester_facotory.create_ingester_for(@xml_filename).start
  end

  def next
    @generator_factory.create_generator_for(@output_path).start
  end

  def done
    puts "finished processing - provide basic run stats"
  end

  def store record
    @bubble_store.store record
  end

end