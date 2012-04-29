
class Ingester

  def initialize(processor, bubble_store)
    raise ArgumentError, 'Ingestor requires a processor' if processor.nil?
    raise ArgumentError, 'Expected Processor type' if (Processor != processor.class)
    raise ArgumentError, 'Ingestor requires a BubbleStore' if bubble_store.nil?
    raise ArgumentError, 'Expected BubbleStore type' if (BubbleStore != bubble_store.class)
    @processor = processor
    @bubble_store = bubble_store
  end

  def startIngesting xml_file_path
    true
  end

  #private
  #
  #start queue
  #start ingestion
  #notify processor
end