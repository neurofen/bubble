require 'progress_bar'

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
    @spinner = Spinner.new
  end

  def start
    puts "\n\n------------------------\nStarting Ingestion"
    @spinner.start
    @ingester_facotory.create_ingester_for(@xml_filename).start
  end

  def next
    @spinner.stop
    puts "\rStarting Page Generation\n\n"
    @generator_factory.create_generator_for(@output_path).start
  end

  def done
    puts "\n\nProcessing complete\n------------------------\n\n "
  end

  def store record
    @bubble_store.store record
  end

  def monitor max
    ProcessMonitor.new max
  end

end