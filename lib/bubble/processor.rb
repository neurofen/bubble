class Processor

  attr_reader :bubble_store

  def initialize(xml_filename, output_path, db_path)
    @xml_filename = xml_filename
    @output_path = output_path
    @bubble_store = BubbleStore.new(db_path)
    template = File.expand_path('../../../data/templates/output-template.html', __FILE__)
    @ingester_facotory = IngesterFactory.new(self)
    @generator_factory = GeneratorFactory.new(self, template)
    @bubble_store.drop
  end

  def start
    puts "\n\n\t------------------------\n\tStarting Ingestion\n\t------------------------\n\n"
    @ingester_facotory.create_ingester_for(@xml_filename).start
  end

  def next
    puts "\n\n\t------------------------\n\tStarting Page Generation\n\t------------------------\n\n"
    @generator_factory.create_generator_for(@output_path).start
  end

  def done
    puts "\n\n\t------------------------\n\tProcessing complete\n\t------------------------\n\n "
  end

  def store record
    @bubble_store.store record
  end

end